local isPoisoned = false
local poisonTicks = 0

-- Fungsi yang dipanggil saat pemain memakan spoiled_food
exports('EatSpoiledFood', function(data, slot)
    local playerPed = PlayerPedId()

    -- Notifikasi awal
    lib.notify({
        title = 'Keracunan Makanan',
        description = 'Kamu memakan makanan basi! Perutmu terasa sangat mual...',
        type = 'error',
        duration = 5000
    })

    -- Mengatur durasi keracunan (contoh: berlangsung selama 5 kali pengurangan HP)
    poisonTicks = 5 

    -- Jika pemain belum dalam kondisi keracunan, jalankan loop pengurangan HP
    if not isPoisoned then
        isPoisoned = true
        
        CreateThread(function()
            while poisonTicks > 0 do
                -- Tunggu selama 1 menit (60.000 milidetik)
                Wait(120000)

                local currentHealth = GetEntityHealth(playerPed)

                -- Cek apakah pemain masih hidup
                if currentHealth > 100 then
                    local damageAmount = 15 -- Jumlah HP yang berkurang setiap menit (sesuaikan nilai ini)
                    local newHealth = currentHealth - damageAmount

                    -- Kurangi health pemain
                    SetEntityHealth(playerPed, math.max(100, newHealth))

                    -- Efek visual & notifikasi mual
                    ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.08)
                    lib.notify({
                        title = 'Sakit Perut',
                        description = 'Kamu merasa mual dan kehilangan darah akibat racun makanan...',
                        type = 'warning'
                    })
                else
                    -- Jika pemain mati atau dalam kondisi pingsan, batalkan keracunan
                    break
                end

                poisonTicks = poisonTicks - 1
            end

            -- Reset status keracunan setelah durasi habis
            isPoisoned = false
            lib.notify({
                title = 'Kondisi Membaik',
                description = 'Efek keracunan makanan telah hilang.',
                type = 'inform'
            })
        end)
    end
end)

-- Load target
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
