Citizen.CreateThread(function()
	-- Open Tray Stash
	exports.ox_target:addBoxZone({
		coords = vec3(0, 0, 0),
		size = vec3(1, 1, 1),
		rotation = 0,
		debug = true,
		options = {
			{
				name = 'open_taco_tray_1',
				icon = 'fas fa-inbox',
				label = 'Tray Taco',
				onSelect = function(data)
					lib.callback('tacobusiness:server:openTacoTray', false, function(stashId)
						exports.ox_inventory:openInventory('stash',{
							id = stashId,
							owner = false
						})
					end)
				end
			}
		}
    })

    -- Open Storage Stash 1
	exports.ox_target:addBoxZone({
		coords = vec3(0, 0, 0),
		size = vec3(1, 1, 1),
		rotation = 0,
		debug = true,
		options = {
			{
				name = 'open_taco_storage_1',
				icon = 'fas fa-inbox',
				label = 'Storage Taco 1',
				onSelect = function(data)
					lib.callback('tacobusiness:server:openTacoTray', false, function(stashId)
						exports.ox_inventory:openInventory('stash',{
							id = stashId,
							owner = false
						})
					end)
				end
			}
		}
    })

    -- Open Storage Stash 2
	exports.ox_target:addBoxZone({
		coords = vec3(0, 0, 0),
		size = vec3(1, 1, 1),
		rotation = 0,
		debug = true,
		options = {
			{
				name = 'open_taco_storage_2',
				icon = 'fas fa-inbox',
				label = 'Storage Taco 2',
				onSelect = function(data)
					lib.callback('tacobusiness:server:openTacoTray', false, function(stashId)
						exports.ox_inventory:openInventory('stash',{
							id = stashId,
							owner = false
						})
					end)
				end
			}
		}
    })

end)
