local effect = require("__fq-core__/lib/trigger_effect")

data:extend({
    {
        type = "ammo-category",
        name = "fqn-sonic"
    },
    {
        type = "gun",
        name = "fqn-sonoblaster",
        stack_size = 5,

        icon = "__base__/graphics/icons/combat-shotgun.png",
        icon_size = 64,

        subgroup = "gun",
        order = "fqn[sonoblaster]",

        attack_parameters = {
            type = "projectile",
            ammo_category = "fqn-sonic",
            cooldown = 12,
            movement_slow_down_factor = 0.5,
            projectile_creation_distance = 1,
            range = 20
        }
    },
    {
        type = "sticker",
        name = "fqn-sonic-slowdown-sticker",
        duration_in_ticks = 30,
        target_movement_modifier_from = 0.5,
        target_movement_modifier_to = 1.0
    },
    {
        type = "projectile",
        name = "fqn-sonic-blast",
        
        flags = {"not-on-map"},
        collision_box = {{-1.00,-0.25}, {1.00,0.25}},
        direction_only = true,
        acceleration = 0,
        piercing_damage = 9999,

        action = {
            type = "direct",
            action_delivery = {
                type = "instant",
                target_effects = {
                    {type = "damage", damage = {type = "impact", amount = 5}},
                    {type = "create-sticker", sticker = "fqn-sonic-slowdown-sticker"},
                    effect.knockback{amount=150, randomness=1}
                }
            }
        },
        final_action = {
            {type = "direct", action_delivery = {type = "instant", target_effects = {type = "damage", damage = {type="impact", amount=1}}}}
        },

        animation =
        {
            filename = "__base__/graphics/entity/bullet/bullet.png",
            draw_as_glow = true,
            frame_count = 1,
            width = 3,
            height = 50,
            priority = "high"
        }
    },
    {
        type = "ammo",
        name = "fqn-sonoblaster-ammo",
        stack_size = 200,
        icon = "__base__/graphics/icons/shotgun-shell.png",
        icon_size = 64,

        ammo_type = {
            category = "fqn-sonic",
            target_type = "direction",
            clamp_position = true,
            action = {
                type = "direct",
                action_delivery = {
                    {
                        type = "projectile",
                        projectile = "fqn-sonic-blast",
                        starting_speed = 0.5,
                        starting_speed_deviation = 0,
                        direction_deviation = 0,
                        range_deviation = 0,
                        max_range = 20
                    },
                    {
                        type = "instant",
                        target_effects = {effect.recoil{amount=5}}
                    }
                }
            }
        }
    }
})