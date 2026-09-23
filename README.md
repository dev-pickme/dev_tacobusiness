# dev_tacobusiness [on progress]
Taco Business for fiveM [QBox]

1. Open jobs.lua in `resources/[qbx]/qbx_core/shared/`, add line :
```lua
	['tacobusiness'] = {
        label = 'Taco Business',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Seller',
                payment = 20
            },
			[1] = {
                name = 'Owner',
				isboss = true,
				bankAuth = true,
                payment = 40
            },
        },
    },
```
2. Open server.lua in `resource/[qbx]/qbx_management/config/`, add line in ``menus = {HERE}``.
```lua
		tacobusiness = {
            coords = vec3(0, 0, 0),
            size = vec3(1, 1, 1),
            rotation = 0,
            type = 'job',
        },
```
- Get coords in game `/Admin > Developer Options > Copy Vector 3`.
- You can edit size what you want.

3. Create folder `[external]` on `resource`.
4. Drag dev_taco to `[external]` folder.
