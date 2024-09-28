local atk_runtime = require("__fq-core__/lib/attack/runtime")

atk_runtime.init {
    namespace = "fqn",
    extensions = {}
}

script.on_init(function()
    atk_runtime.on_init()
end)

script.on_configuration_changed(function()
    atk_runtime.on_configuration_changed()
end)

script.on_event(defines.events.on_tick, function()
    atk_runtime.on_tick()
end)

script.on_event(defines.events.on_script_trigger_effect, function(event)
    atk_runtime.on_script_trigger_effect(event)
end)

