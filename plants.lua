local function plant_def(desc, texture)
    return {
        description = desc,
        drawtype = "plantlike",
        tiles = {texture},
        inventory_image = texture,
        wield_image = texture,
        paramtype = "light",
        sunlight_propagates = true,
        walkable = false,
        buildable_to = true,
        groups = {snappy=3, flammable=2, attached_node=1},
        selection_box = {
            type = "fixed",
            fixed = {-0.2, -0.5, -0.2, 0.2, 0.5, 0.2},
        },
    }
end

minetest.register_node("friandises:candy_cane",
    plant_def("Candy Cane", "candy_cane.png"))

minetest.register_node("friandises:fleur_sucre",
    plant_def("Sugar Flower", "fleur_sucre.png"))

minetest.register_node("friandises:mushroom_sucre", {
    description = "Sweet Mushroom",
    drawtype = "plantlike",
    tiles = {"mushroom_sucre.png"},
    inventory_image = "mushroom_sucre.png",
    paramtype = "light",
    sunlight_propagates = true,
    walkable = false,
    light_source = 5,
    groups = {snappy=3},
})

minetest.register_node("friandises:bulbe_gelee", {
    description = "Jelly Bulb",
    drawtype = "plantlike",
    tiles = {"bulbe_gelee.png"},
    inventory_image = "bulbe_gelee.png",
    paramtype = "light",
    sunlight_propagates = true,
    walkable = false,
    light_source = 3,
    groups = {snappy=3},
})