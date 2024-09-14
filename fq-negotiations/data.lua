local effect = require("__fq-core__/lib/trigger_effect")

local rocket_fuel_tech = data.raw.technology["rocket-fuel"]
table.insert(rocket_fuel_tech.effects, {
    type = "unlock-recipe",
    recipe = "fqn-rocket-booster-ammo"
})

data:extend({
    {
        type = "ammo",
        name = "fqn-rocket-booster-ammo",
        icon = "__fq-negotiations__/assets/rocket-booster-ammo.png",
        icon_size = 64,

        stack_size = 100,
        subgroup = "ammo",
        order = "e[flamethrower]-[rocket-booster]",

        magazine_size = 1000,
        ammo_type = {
            category = "flamethrower",
            target_type = "direction",
            action = {
                {
                    type = "direct",
                    action_delivery = {
                        type = "instant",
                        source_effects = {
                            effect.recoil(12),
                            {type = "create-fire", entity_name = "fire-flame"},
                        }
                    }
                }
            }
        }
    },
    --[[
        Note: we can't just edit vanilla rocket fuel to do this,
        because this would require changing its type,
        which can break other mods (e.g. Editor Extensions)
    ]]--
    {
        type = "recipe",
        name = "fqn-rocket-booster-ammo",
        enabled = false,
        energy_required = 5,
        ingredients = {
            {type = "item", name = "rocket-fuel",      amount = 1},
            {type = "item", name = "advanced-circuit", amount = 1}
        },
        result = "fqn-rocket-booster-ammo"
    }
})