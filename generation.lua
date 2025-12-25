-- Génération des blocs
local function ore(block, scarcity, size)
    minetest.register_ore({
        ore_type = "scatter",
        ore = block,
        wherein = "default:stone",
        clust_scarcity = scarcity,
        clust_size = size,
        y_min = -100,
        y_max = -10,
    })
end

ore("friandises:chocolat", 8*8*8, 5)
ore("friandises:guimauve", 9*9*9, 4)
ore("friandises:caramel", 12*12*12, 3)
ore("friandises:gelee", 10*10*10, 3)

-- Tablettes de chocolat 5x3
function friandises.place_chocolate_tablet(pos)
    for y = 0, 4 do
        for x = -1, 1 do
            local p = {x=pos.x+x, y=pos.y+y, z=pos.z}
            minetest.set_node(p, {name="friandises:chocolat"})
        end
    end
end