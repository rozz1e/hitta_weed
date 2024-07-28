ESX = exports["es_extended"]:getSharedObject()

local cachedPlant = {}

RegisterNetEvent('hitta_weed:notify', function(title, desc, style)
    lib.notify({
        title = title,
        description = desc,
        duration = 3500,
        type = style
    })
end)

createBlip = function(coords, sprite, color, text, scale)
	local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
	SetBlipSprite(blip, sprite)
	SetBlipDisplay(blip, 4)
	SetBlipScale(blip, scale)
	SetBlipColour(blip, color)
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(text)
	EndTextCommandSetBlipName(blip)
end

pickWeed = function(entity)
    local harvesting = true

    CreateThread(function()
        while harvesting do
            local sleep = 5000 -- give weed every 5 seconds
            if harvesting then
                if lib.progressCircle({
                    duration = Config.Harvest.duration,
                    position = 'bottom',
                    label = Strings.picking_progress,
                    useWhileDead = false,
                    canCancel = true,
                    disable = {
                        car = true,
                    },
                    anim = {
                        scenario = 'WORLD_HUMAN_GARDENER_PLANT',
                    },
                }) then
                    TriggerEvent('hitta_weed:notify', Strings.success, Strings.successful_pick_desc, 'success')
                    TriggerServerEvent('hitta_weed:giveWeed')
                else
                    harvesting = false
                    TriggerEvent('hitta_weed:notify', Strings.cancelled, Strings.cancelled_desc, 'error')
                end
            end
            Wait(sleep)
        end
    end)


    Wait(Config.Harvest.duration) -- wait for item pickup animation to finish

    cachedPlant[entity] = true
    harvesting = false
    
    ClearPedTasksImmediately(cache.ped)
end

enterLab = function(lab)
    DoScreenFadeOut(1000)
    Wait(3000)
        SetEntityCoords(cache.ped, 1066.40, -3183.41, -39.16, false, false, false, false)
        SetEntityHeading(cache.ped, 92.06)
        TriggerEvent('hitta_weed:notify', Strings.laboratory, Strings.successful_entered_lab_desc, 'success')
    DoScreenFadeIn(1000)
    Wait(3000)
end

exitLab = function(lab)
    DoScreenFadeOut(1000)
    Wait(3000)
       SetEntityCoords(cache.ped, Config.Process.lab.entrance, false, false, false, false)
       SetEntityHeading(cache.ped, Config.Process.lab.entranceHeading)
       TriggerEvent('hitta_weed:notify', Strings.laboratory, Strings.successful_exit_lab_desc, 'success')
    DoScreenFadeIn(1000)
    Wait(3000)
end

processWeed = function(process)
    if ItemCount(Config.Harvest.item) and hasItem(Config.Process.itemNeeded) then
        if lib.progressCircle({
            duration = Config.Process.duration,
            position = 'bottom',
            label = Strings.processing_progress,
            useWhileDead = false,
            canCancel = true,
            disable = {
                car = true,
            },
            anim = {
                scenario = 'PROP_HUMAN_PARKING_METER',
            },
        }) then
            TriggerEvent('hitta_weed:notify', Strings.success, Strings.successful_progress_desc, 'success')
            TriggerServerEvent('hitta_weed:processedWeed')
        else
            TriggerEvent('hitta_weed:notify', Strings.cancelled, Strings.cancelled_progress_desc, 'error')
        end
    else
        TriggerEvent('hitta_weed:notify', Strings.process, Strings.unsuccessful_process_noitems_desc, 'error')
    end
end


hasItem = function(itemName)
    local inventory = ESX.GetPlayerData().inventory
    for i = 1, #inventory do
        if inventory[i].name == itemName and inventory[i].count > 0 then
            return true
        end
    end
    return false
end

ItemCount = function(itemName)
    local inventory = ESX.GetPlayerData().inventory
    for i = 1, #inventory do
        if inventory[i].name == itemName and inventory[i].count >= Config.Process.harvestNeededCount then
            return true
        end
    end
    return false
end
