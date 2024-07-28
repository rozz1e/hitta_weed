RegisterNetEvent('hitta_weed:processedWeed')
AddEventHandler('hitta_weed:processedWeed', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local weed = xPlayer.getInventoryItem(Config.Harvest.item)
    local neededItem = xPlayer.getInventoryItem(Config.Process.itemNeeded)

    if weed.count >= Config.Process.harvestNeededCount then
        xPlayer.removeInventoryItem(Config.Harvest.item, Config.Process.harvestNeededCount)
        xPlayer.addInventoryItem(Config.Process.item, Config.Process.itemCount)
    else
        TriggerClientEvent('hitta_weed:notify', source, Strings.unsuccessful, Strings.unsuccessful_processed_desc, 'error')
    end
end)
