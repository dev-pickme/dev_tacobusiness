# dev_tacobusiness [on progress]
Taco Business for fiveM [QBox]

STEP by STEP how to install Taco Business on your server
## 1. Add Job to list jobs
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

## 2. Add Menu Job in Store
Open server.lua in `resource/[qbx]/qbx_management/config/`, add line in ``menus = {HERE}``.
```lua
		tacobusiness = {
            coords = vec3(-1249.34, -1472.78, 4.4),
            size = vec3(0.5, 0.3, 0.7),
            rotation = 219,
            type = 'job',
        },
```
- Get coords in game `/Admin > Developer Options > Copy Vector 3`.
- You can edit size what you want.
2. change useTarget on client.lua in `resource/[qbx]/qbx_management/config/` from false to true.

## 3. Add to FiveM
1. Create folder `[external]` on `resource`.
2. Drag dev_tacobusiness to `[external]` folder.

## 4. Manage Items
1. Open items.lua on `resource/[ox]/ox_inventory/data` add line on `return {HERE}`
```lua
    -- Taco Business Items
    ['raw_tortilla'] = {
		label = 'Tortilla',
		weight = 50,
		stack = true,
		close = false
	},
    ['fried_tortilla'] = {
		label = 'Fried Tortilla',
		weight = 50,
		degrade = 2880,
		stack = true,
		close = false,
		consume = 1,
		client = {
            image = 'fried_tortilla.png',
			status = { hunger = 50000 },
			anim = 'eating',
            prop = 'burger',
            usetime = 3000,
            notification = 'You ate a Fried Tortilla.'
        }
	},
    ['cabbage'] = {
		label = 'Cabbage',
		weight = 100,
		stack = true,
		close = false
	},
    ['sliced_cabbage'] = {
		label = 'Sliced Cabbage',
		weight = 100,
		stack = true,
		close = false
	},
	['raw_beef'] = {
		label = 'Raw Beef',
		weight = 150,
		stack = true,
		close = false
	},
	['roasted_beef'] = {
		label = 'Roasted Beef',
		weight = 150,
		degrade = 2880,
		stack = true,
		close = false,
		consume = 1,
		client = {
            image = 'roasted_beef.png',
			status = { hunger = 150000 },
			anim = 'eating',
            prop = 'burger',
            usetime = 3000,
            notification = 'You ate a Roasted Beef.'
        }
	},
    ['taco_complete'] = {
		label = 'Taco Complete',
		weight = 15,
		degrade = 2880,
		stack = true,
		close = false,
		consume = 1,
        client = {
            image = 'taco_complete.png',
			status = { hunger = 300000 },
			anim = 'eating',
            prop = 'burger',
            usetime = 3000,
            notification = 'You ate a Taco Complete.'
        }
	},
    ['taco_protein'] = {
		label = 'Taco Protein',
		weight = 15,
		degrade = 2880,
		stack = true,
		close = false,
		consume = 1,
        client = {
            image = 'taco_protein.png',
			status = { hunger = 250000 },
			anim = 'eating',
            prop = 'burger',
            usetime = 3000,
            notification = 'You ate a Taco Protein.'
        }
	},
    ['taco_vegetable'] = {
		label = 'Taco Vegetable',
		weight = 15,
		degrade = 2880,
		stack = true,
		close = false,
		consume = 1,
        client = {
            image = 'taco_vegetable.png',
			status = { hunger = 200000 },
			anim = 'eating',
            prop = 'burger',
            usetime = 3000,
            notification = 'You ate a Taco Vegetable.'
        }
	},
```
2. Cut folder `images` to `resource/[ox]/ox_inventory/web/` and replace folder.

## 5. Cooking
1. Open file crafting.lua in `resource/[ox]/ox_inventory/data/` add line on return {HERE}
```lua
        -- Cooking Taco
    {
        name = 'cooking_taco',
        group = { ['tacobusiness'] },
		items = {
			{
				name = 'fried_tortilla',
				ingredients = {
					raw_tortilla = 1
				},
				duration = 10000,
				count = 1,
			},
			{
				name = 'taco_complete',
				ingredients = {
					fried_tortilla = 1,
					roasted_beef = 1,
                    sliced_cabbage = 1
				},
				duration = 10000,
				count = 1,
			},
			{
				name = 'taco_protein',
				ingredients = {
					fried_tortilla = 1,
					roasted_beef = 1
				},
				duration = 5000,
				count = 1,
			},
			{
				name = 'taco_vegetable',
				ingredients = {
					fried_tortilla = 1,
                    sliced_cabbage = 1
				},
				duration = 5000,
				count = 1,
			},
		},
		points = {
			vec3(-1248.96, -1473.55, 3.6)
		},
		zones = {
			{
                label = "Cooking Taco",
                icon = 'fas fa-circle',
				debug = false,
				coords = vec3(-1248.9, -1473.66, 3.28),
				size = vec3(0.5, 0.3, 2),
				distance = 1.5,
				rotation = 308,
			},
		},
	},
	-- Cooking Beef
    {
        name = 'cooking_beef',
        group = { ['tacobusiness'] },
		items = {
			{
				name = 'roasted_beef',
				ingredients = {
                    raw_beef = 1
				},
				duration = 10000,
				count = 1,
			},
		},
		points = {
			vec3(-1249.67, -1473.42, 3.28)
		},
		zones = {
			{
                label = "Cooking Beef",
                icon = 'fas fa-circle',
				debug = false,
				coords = vec3(-1249.37, -1473.30, 3.28),
				size = vec3(0.4, 0.2, 3),
				distance = 1.5,
				rotation = 308.63,
			},
		},
	},
	-- Slice Cabbage
    {
        name = 'slice_cabbage',
        group = { ['tacobusiness'] },
		items = {
			{
				name = 'sliced_cabbage',
				ingredients = {
                    cabbage = 1
				},
				duration = 10000,
				count = 5,
			},
		},
		points = {
			vec3(-1248.14, -1474.40, 3.3)
		},
		zones = {
			{
                label = "Slicing Cabbage",
                icon = 'fas fa-circle',
				debug = false,
				coords = vec3(-1248.14, -1474.40, 3.3),
				size = vec3(0.4, 0.6, 1.9),
				distance = 1.5,
				rotation = 308.63,
			},
		},
	},
```
- Get coords in game `/Admin > Developer Options > Copy Vector 3`.