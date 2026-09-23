local OxInventory = exports.ox_inventory

-- Daftar nama item yang BISA membusuk menjadi spoiled_food
-- Sesuaikan nama item dengan yang ada di ox_inventory/data/items.lua Anda
local degradableFoods = {
    ['burger'] = true,
    ['sandwich'] = true,
    ['fried_tortilla'] = true,
    ['roasted_beef'] = true,
    ['taco_complete'] = true,
	['taco_protein'] = true,
	['taco_vegetable'] = true
}

-- Interval pengecekan (dalam milidetik). Default: Setiap 60 detik (60000 ms)
local CHECK_INTERVAL = 60000 

CreateThread(function()
    while true do
        Wait(CHECK_INTERVAL)

        -- Mengambil daftar seluruh pemain yang sedang online
        local players = GetPlayers()
        local currentTime = os.time()

        for i = 1, #players do
            local playerId = tonumber(players[i])
            if playerId then
                -- Mengambil data inventory pemain
                local items = OxInventory:GetInventoryItems(playerId)

                if items then
                    for slot, item in pairs(items) do
                        -- Cek apakah item terdaftar sebagai makanan & memiliki metadata durability
                        if item and degradableFoods[item.name] and item.metadata and item.metadata.durability then
                            
                            -- Jika waktu durability telah melewati waktu saat ini (kedaluwarsa)
                            if item.metadata.durability <= currentTime then
                                local itemCount = item.count or 1
                                local itemSlot = item.slot

                                -- 1. Hapus item yang busuk dari slot spesifik
                                local removed = OxInventory:RemoveItem(playerId, item.name, itemCount, nil, itemSlot)
                                
                                -- 2. Tambahkan spoiled_food sebagai gantinya
                                if removed then
                                    OxInventory:AddItem(playerId, 'spoiled_food', itemCount)
                                    TriggerClientEvent('ox_lib:notify', playerId, {
                                        type = 'warning',
                                        description = ('%s milikmu telah membusuk!'):format(item.label or item.name)
                                    })
                                end
                            end

                        end
                    end
                end
            end
        end
    end
end)

-- Tray Stash
lib.callback.register('tacobusiness:server:openTacoTray', function(source)

	local stashid = 'taco_tray_1'
	
	exports.ox_inventory:RegisterStash(
		stashid,
		"Taco Tray",
		5,
		1000,
		false,
		nil
	)
	
	return stashid

end)

-- Storage Stash
lib.callback.register('tacobusiness:server:openTacoStash', function(source)
	local Player = exports['qbx_core']:GetPlayer(source)
	if not(Player and Player.PlayerData.job.name == 'tacobusiness') then
		return nil
	end
	
	local stashId = 'taco_storage_1'
	exports.ox_inventory:RegisterStash(
		stashId,
		'Storage 1',
		50,
		10000,
		true,
		'tacobusiness'
	)
	return stashId
end)