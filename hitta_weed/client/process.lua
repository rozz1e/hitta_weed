
CreateThread(function()
    local k = Config.Process

    if k.blip.enabled then
        createBlip(k.blip.coords, k.blip.sprite, k.blip.color, k.blip.name, k.blip.scale, false)
    end

    local textUI
    while true do

        local sleep = 1200
        local playerPedP = cache.ped
        local playerCoordsP = GetEntityCoords(cache.ped)
        local dist = #(playerCoordsP - k.lab.entrance)

        if k.lab.enabled then
            if dist <= 2 then
                sleep = 0
                if not textUI then
                    lib.showTextUI(Strings.enter_lab)
                    textUI = true
                end
                if IsControlJustReleased(0, 38) then
                    textUI = nil
                    lib.hideTextUI()
                    enterLab()
                end
            elseif dist >= 2.2 and textUI then
                sleep = 0
                lib.hideTextUI()
                textUI = nil
            end
        end
        Wait(sleep)
    end
end)

CreateThread(function()
    local k = Config.Process

    local textUI
    while true do

        local sleep = 1200
        local playerPed = cache.ped
        local playerCoords = GetEntityCoords(cache.ped)
        local dist = #(playerCoords - k.lab.exit)

        if k.lab.enabled then
            if dist <= 2 then
                sleep = 0
                if not textUI then
                    lib.showTextUI(Strings.exit_lab)
                    textUI = true
                end
                if IsControlJustReleased(0, 38) then
                    textUI = nil
                    lib.hideTextUI()
                    exitLab()
                end
            elseif dist >= 2.2 and textUI then
                sleep = 0
                lib.hideTextUI()
                textUI = nil
            end
        end
        Wait(sleep)
    end
end)

CreateThread(function()
    local k = Config.Process

    local textUI
    while true do

        local sleep = 1200
        local playerPed = cache.ped
        local playerCoords = GetEntityCoords(cache.ped)
        local dist = #(playerCoords - k.coords)

        if dist <= 2 then
            sleep = 0
            if not textUI then
                lib.showTextUI(Strings.process_weed)
                textUI = true
            end
            if IsControlJustReleased(0, 38) then
                textUI = nil
                lib.hideTextUI()
                processWeed()
            end
        elseif dist >= 2.2 and textUI then
            sleep = 0
            lib.hideTextUI()
            textUI = nil
        end
        Wait(sleep)
    end
end)

CreateThread(function()
    local k = Config.Process

    while true do
        if k.marker.enabled then
            DrawMarker(k.marker.type, k.marker.coords, nil, nil, nil, nil, nil, nil, k.marker.scale, k.marker.colour.r, k.marker.colour.g, k.marker.colour.b, k.marker.colour.a, false, true)
        end
        Wait(0)
    end
end)
