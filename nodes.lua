-- Chocolat
minetest.register_node("friandises:chocolat", {
    description = "Chocolate Block",
    tiles = {"chocolat.png"},
    groups = {cracky=3},
    sounds = default.node_sound_wood_defaults(),
})

-- Guimauve
minetest.register_node("friandises:guimauve", {
    description = "Marshmallow Block",
    tiles = {"guimauve.png"},
    groups = {crumbly=3},
    sounds = default.node_sound_dirt_defaults(),
})

-- Caramel lumineux
minetest.register_node("friandises:caramel", {
    description = "Glowing Caramel Block",
    tiles = {"caramel.png"},
    light_source = 10,
    groups = {cracky=2},
    sounds = default.node_sound_wood_defaults(),
})

-- Gelée rebondissante
minetest.register_node("friandises:gelee", {
    description = "Jelly Block",
    tiles = {"gelee.png"},
    light_source = 2,
    groups = {snappy=3},
    sounds = default.node_sound_glass_defaults(),
    on_walk_over = function(pos, node, player)
        local v = player:get_velocity()
        player:set_velocity({x=v.x, y=6, z=v.z})
    end,
})

-- Sucre scintillant
minetest.register_node("friandises:sucre_scintillant", {
    description = "Sparkling Sugar",
    tiles = {"sucre_scintillant.png"},
    light_source = 6,
    groups = {cracky=3},
    sounds = default.node_sound_glass_defaults(),
})