ESX = exports["es_extended"]:getSharedObject()

RegisterServerEvent('hitta_weed:giveWeed')
AddEventHandler('hitta_weed:giveWeed', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.addInventoryItem(Config.Harvest.item, Config.Harvest.itemCount)
end)
