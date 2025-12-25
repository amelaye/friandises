-- Plantes
local function deco(node, ratio)
    minetest.register_decoration({
        deco_type = "simple",
        place_on = {
            "friandises:chocolat",
            "friandises:guimauve",
            "friandises:caramel"
        },
        sidelen = 16,
        fill_ratio = ratio,
        decoration = node,
        y_min = -100,
        y_max = -10,
    })
end

deco("friandises:candy_cane", 0.03)
deco("friandises:fleur_sucre", 0.02)
deco("friandises:mushroom_sucre", 0.015)
deco("friandises:bulbe_gelee", 0.02)

-- Tablettes géantes
minetest.register_decoration({
    deco_type = "simple",
    place_on = {"default:stone"},
    sidelen = 32,
    fill_ratio = 0.002,
    decoration = "air",
    y_min = -100,
    y_max = -20,
    on_place = function(pos)
        friandises.place_chocolate_tablet(pos)
    end,
})

-- Particules de sucre
minetest.register_globalstep(function()
    for _,player in ipairs(minetest.get_connected_players()) do
        local pos = player:get_pos()
        minetest.add_particlespawner({
            amount = 3,
            time = 1,
            minpos = vector.subtract(pos, 2),
            maxpos = vector.add(pos, 2),
            minvel = {x=0, y=0.2, z=0},
            maxvel = {x=0, y=0.6, z=0},
            minexptime = 1,
            maxexptime = 2,
            minsize = 0.2,
            maxsize = 0.4,
            texture = "particule_sucre.png",
        })
    end
end)