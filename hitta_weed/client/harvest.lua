
CreateThread(function()
    local v = Config.Harvest

    if v.blip.enabled then
        createBlip(v.blip.coords, v.blip.sprite, v.blip.color, v.blip.name, v.blip.scale, false)
    end

    local textUI
    while true do

        local sleep = 1200
        local playerPed = cache.ped
        local playerCoords = GetEntityCoords(cache.ped)
        local plant = GetClosestObjectOfType(playerCoords, 1.0, GetHashKey(Config.Harvest.plant), false, false, false)
        local dist = #(playerCoords - plant)
        local entity = nil

        if DoesEntityExist(plant) then
            entity = plant
            sleep = 5

            if not textUI then
                lib.showTextUI(v.label)
                textUI = true
            end
            if IsControlJustReleased(0, 38) then
                if playerPed then
                    textUI = nil
                    lib.hideTextUI()
                    pickWeed(entity)
                else
                    TriggerEvent('hitta_weed:notify', Strings.unsuccessful, Strings.unsuccessful_pick_desc, 'error')
                end
            end
        elseif dist >= 2.2 and textUI then
            sleep = 0
            lib.hideTextUI()
            textUI = nil
        end
        Wait(sleep)
    end
end)
