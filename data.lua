local engineCore = table.deepcopy(data.raw["item"]["engine-unit"])

engineCore.name = "engine-core"
engineCore.icon = "__cast-engines__/graphics/icons/engine-core.png"
engineCore.hidden = true

data:extend({
   {
     type = "technology",
     name = "foundry-casting-engine-core",
     icon_size = 256, icon_mipmaps = 4,
     icon = "__space-age__/graphics/technology/foundry.png",
     effects = {
       {type = "unlock-recipe", recipe = "foundry-casting-engine-core"},
       {type = "unlock-recipe", recipe = "assembling-engine-core"}
     },
     prerequisites = { "metallurgic-science-pack" },
     unit = {
       ingredients = {
         {"automation-science-pack", 1}, -- red
         {"logistic-science-pack", 1}, -- green
         {"chemical-science-pack", 1}, -- blue
         {"production-science-pack", 1}, -- purple
         {"utility-science-pack", 1}, -- yellow
         {"metallurgic-science-pack", 1}
       },
       time = 30,
       count = 2000
     },
     order = "z"
   },

   engineCore,

   {
     type = "recipe",
     name = "foundry-casting-engine-core",
     -- 1 steel, 1 gear, and 1 pipe worth of molten iron
     -- 30, 10, 10
     enabled = false,
     -- standard engines take 10 seconds at 1x crafting speed, 8s in green assemblers
     -- 6s in a foundry would be 24
     energy_required = 12,
     category = "metallurgy",
     group = "intermediate-products",
     subgroup = "vulcanus-processes",
     icon = "__cast-engines__/graphics/icons/casting-engine-core.png",
     ingredients = {
       {type = "fluid", name = "molten-iron", amount = 100, fluidbox_multiplier = 4},
       {type = "item", name = "tungsten-plate", amount = 1},
     },
     results = {{type = "item", name = "engine-core", amount = 1}},
     main_product = "engine-core",
     allow_productivity = true,
     allow_decomposition = false,
     auto_recycle = true,
     show_amount_in_title = true,
     allow_intermediates = true,
     allow_as_intermediate = true,
     unlock_results = true,
     order = "b[casting]-za[engine]",
   },

   {
     type = "recipe",
     name = "assembling-engine-core",
     enabled = false,
     -- 8 seconds total craft time for vanilla engines
     -- 6s foundry + 2s assembling
     energy_required = 2,
     category = "crafting",
     group = "intermediate-products",
     subgroup = "vulcanus-processes",
     icon = "__cast-engines__/graphics/icons/assembling-engine-core.png",
     ingredients = {
       {type = "item", name = "engine-core", amount = 1},
       {type = "item", name = "iron-gear-wheel", amount = 1},
     },
     results = {{type = "item", name = "engine-unit", amount = 1}},
     main_product = "engine-unit",
     allow_productivity = false,
     allow_decomposition = false,
     auto_recycle = true,
     show_amount_in_title = true,
     allow_intermediates = true,
     allow_as_intermediate = true,
     order = "b[casting]-zb[engine]",
   }
})
