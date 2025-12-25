local c_air     = minetest.get_content_id("air")
local c_stone   = minetest.get_content_id("default:stone")

local c_choco   = minetest.get_content_id("friandises:chocolat")
local c_guim    = minetest.get_content_id("friandises:guimauve")
local c_caramel = minetest.get_content_id("friandises:caramel")

-- ===============================
-- CONFIGURATION DES REALMS
-- ===============================
local REALM_SIZE = 512        -- taille d'une zone
local REALM_CHANCE = 0.12     -- 12 % des zones deviennent Candy Cave
local Y_MIN = -200
local Y_MAX = -50

-- Bruit interne (forme des cavernes)
local noise_shape = minetest.get_perlin({
    offset = 0,
    scale = 1,
    spread = {x=48, y=32, z=48},
    seed = 424242,
    octaves = 2,
    persist = 0.6,
})

-- ===============================
-- DÉTERMINER SI ON EST DANS UN REALM
-- ===============================
local function is_candy_realm(pos)
    local rx = math.floor(pos.x / REALM_SIZE)
    local rz = math.floor(pos.z / REALM_SIZE)

    -- graine stable par zone
    local seed = rx * 734287 + rz * 912271
    local rand = (seed % 1000) / 1000

    return rand < REALM_CHANCE
end

-- ===============================
-- MAPGEN
-- ===============================
minetest.register_on_generated(function(minp, maxp, seed)
    -- hors zone verticale
    if maxp.y < Y_MIN or minp.y > Y_MAX then return end

    -- centre du chunk
    local center = {
        x = (minp.x + maxp.x) / 2,
        y = (minp.y + maxp.y) / 2,
        z = (minp.z + maxp.z) / 2,
    }

    -- pas un Candy Realm → on ignore TOUT
    if not is_candy_realm(center) then return end

    local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
    local data = vm:get_data()
    local area = VoxelArea:new({MinEdge=emin, MaxEdge=emax})

    for z = minp.z+1, maxp.z-1 do
    for y = math.max(minp.y, Y_MIN), math.min(maxp.y, Y_MAX) do
    for x = minp.x+1, maxp.x-1 do
        local vi = area:index(x,y,z)

        if data[vi] == c_stone then
            local n = noise_shape:get_3d({x=x, y=y, z=z})

            if n > 0.62 then
                data[vi] = c_air

                -- Parois sucrées locales
                for _,o in ipairs({
                    {1,0,0},{-1,0,0},{0,1,0},{0,-1,0},{0,0,1},{0,0,-1}
                }) do
                    local ni = area:index(x+o[1], y+o[2], z+o[3])
                    if data[ni] == c_stone then
                        local r = math.random(10)
                        if r <= 5 then
                            data[ni] = c_choco
                        elseif r <= 8 then
                            data[ni] = c_guim
                        else
                            data[ni] = c_caramel
                        end
                    end
                end
            end
        end
    end
    end
    end

    vm:set_data(data)
    vm:calc_lighting()
    vm:write_to_map()
end)