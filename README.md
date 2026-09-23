# dev_tacobusiness [on progress]
Taco Business for fiveM [QBox]

## 1. Add Job To Store
Open jobs.lua in `resources/[qbx]/qbx_core/shared/`, add line :
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
            coords = vec3(0, 0, 0),
            size = vec3(1, 1, 1),
            rotation = 0,
            type = 'job',
        },
```
- Get coords in game `/Admin > Developer Options > Copy Vector 3`.
- You can edit size what you want.

## 3. Add to FiveM
1. Create folder `[external]` on `resource`.
2. Drag dev_taco to `[external]` folder.

## 4. Manage Items
1. Open items.lua on `resource/[ox]/ox_inventory/data` add line on `return {HERE}`
```lua
    ['tortilla'] = {
		label = 'Tortilla',
		weight = 2,
		stack = false,
		close = false,
		consume = 0
	},
    ['tortilla_protein'] = {
		label = 'Protein',
		weight = 10,
		stack = false,
		close = false,
		consume = 0
	},
    ['tortilla_vegetable'] = {
		label = 'Vegetable',
		weight = 5,
		stack = false,
		close = false,
		consume = 0
	},
    ['sauce'] = {
		label = 'Sauce',
		weight = 5,
		stack = false,
		close = false,
		consume = 0
	},
    ['mayonnaise'] = {
		label = 'Mayonnaise',
		weight = 5,
		stack = false,
		close = false,
		consume = 0
	},
    ['taco_complete'] = {
		label = 'Taco',
		weight = 15,
		stack = true,
		close = false,
		consume = 1
        client = {
            image = 'taco.png',
			status = { hunger = 200000 },
			anim = 'eating',
            prop = 'burger',
            usetime = 3000,
            notification = 'You ate a Taco.'
        }
	},
    ['taco_protein'] = {
		label = 'Taco Protein',
		weight = 15,
		stack = true,
		close = false,
		consume = 1
        client = {
            image = 'taco_protein.png',
			status = { hunger = 200000 },
			anim = 'eating',
            prop = 'burger',
            usetime = 3000,
            notification = 'You ate a Taco Protein.'
        }
	},
    ['taco_vegetable'] = {
		label = 'Taco Vegetable',
		weight = 15,
		stack = true,
		close = false,
		consume = 1
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

## 5. Cooking Tacos
1. Open file crafting.lua in `resource/[ox]/ox_inventory/data/` add line on return {HERE}
```lua
    -- Create Taco Complete
    {
        name = 'cooking_taco',
        group = { ['tacobusiness'] },
		items = {
			{
				name = 'taco_complete',
				ingredients = {
					tortilla = 1,
					tortilla_protein = 1,
                    tortilla_vegetable = 1,
                    sauce = 1,
                    mayonnaise = 1
				},
				duration = 10000,
				count = 1,
			},
			{
				name = 'taco_protein',
				ingredients = {
					tortilla = 1,
					tortilla_protein = 1,
                    sauce = 1,
                    mayonnaise = 1
				},
				duration = 5000,
				count = 1,
			},
			{
				name = 'taco_vegetable',
				ingredients = {
					tortilla = 1,
                    tortilla_vegetable = 1,
                    sauce = 1,
                    mayonnaise = 1
				},
				duration = 5000,
				count = 1,
			},
		},
		points = {
			vec3(0, 0, 0)
		},
		zones = {
			{
                label = "Cooking Taco",
                icon = 'fas fa-circle',
				coords = vec3(0, 0, 0),
				size = vec3(0.5, 0.5, 0.15),
				distance = 1.5,
				rotation = 0,
			},
		},
		blip = { id = 566, colour = 57, scale = 0.8 },
	},
```
- Get coords in game `/Admin > Developer Options > Copy Vector 3`.