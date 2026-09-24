-- Tray Stash
lib.callback.register('tacobusiness:server:openTacoTray', function(source)

	local stashid = 'taco_tray_1'
	
	exports.ox_inventory:RegisterStash(
		stashid,
		"Taco Tray",
		5,
		10000,
		false,
		nil
	)
	
	return stashid

end)

-- Storage Stash 2
lib.callback.register('tacobusiness:server:openTacoStash', function(source)
	local Player = exports['qbx_core']:GetPlayer(source)
	if not(Player and Player.PlayerData.job.name == 'tacobusiness') then
		return nil
	end
	
	local stashId = 'taco_storage_1'
	exports.ox_inventory:RegisterStash(
		stashId,
		'Storage 1',
		20,
		20000,
		true,
		'tacobusiness'
	)
	return stashId
end)

-- Storage Stash 2
lib.callback.register('tacobusiness:server:openTacoStash', function(source)
	local Player = exports['qbx_core']:GetPlayer(source)
	if not(Player and Player.PlayerData.job.name == 'tacobusiness') then
		return nil
	end
	
	local stashId = 'taco_storage_1'
	exports.ox_inventory:RegisterStash(
		stashId,
		'Storage 2',
		20,
		20000,
		true,
		'tacobusiness'
	)
	return stashId
end)