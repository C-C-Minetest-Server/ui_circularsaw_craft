-- ui_circularsaw_craft/init.lua
-- List circular saw usages as recipes
-- Copyright (c) 2026  1F616EMO
-- SPDX-License-Identifier: LGPL-2.1-or-later

local S = core.get_translator("ui_circularsaw_craft")

unified_inventory.register_craft_type("circularsaw", {
    description = S("Cutting"),
    icon = "moreblocks_circular_saw_top.png^[transformR90",
    width = 1,
    height = 1,
})

local function process_one_node(name, modname, material)
    local output_inv = circular_saw:get_output_inv(modname, material, 8, 99)

    for i, item in ipairs(output_inv) do
        unified_inventory.register_craft({
            type = "circularsaw",
            items = { name },
            output = item,
            width = 0,
        })
    end
end

core.register_on_mods_loaded(function()
    for name, data in pairs(circular_saw.known_nodes) do
        process_one_node(name, data[1], data[2])
    end

    process_one_node = nil
end)
