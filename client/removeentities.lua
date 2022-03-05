local objects = {
    -- remove barriers at garage b
    {x = 266.09, y = -349.35, z = 44.74, model = "prop_sec_barier_02b"}, 
    {x = 285.28, y = -355.78, z = 45.13, model = "prop_sec_barier_02a"}, 
    -- remove barriers at garage a
    {x = 206.83, y = -803.22, z = 31.00, model = "prop_sec_barrier_ld_01a"},
    {x = 206.83, y = -803.22, z = 31.00, model = "prop_sec_barier_base_01"},
    {x = 231.21, y = -816.54, z = 30.77, model = "prop_sec_barrier_ld_01a"},
    {x = 231.21, y = -816.54, z = 30.77, model = "prop_sec_barier_base_01"},
    {x = 223.86, y = -740.73, z = 34.26, model = "prop_sec_barrier_ld_01a"},
    {x = 223.86, y = -740.73, z = 34.26, model = "prop_sec_barier_base_01"},
    -- remove poker tables in casino to be replaced with blackjack tables (in qb-blackjack)
    {x = 996.17, y = 51.69, z = 68.45, model = "vw_prop_casino_3cardpoker_01"},
    {x = 1000.66, y = 50.88, z = 68.45, model = "vw_prop_casino_3cardpoker_01"},
    {x = 998.44, y = 60.99, z = 68.45, model = "vw_prop_casino_3cardpoker_01"},
    {x = 994.89, y = 58.29, z = 68.45, model = "vw_prop_casino_3cardpoker_01"},
    -- for sale signs at house vector3(1493.74, 2202.9, 81.18)
    {x = 1490.73, y = 2210.46, z = 80.48, model = "prop_forsale_lrg_04"},
    {x = 1492.71, y = 2494.05, z = 82.42, model = "prop_forsale_sign_01"},
    -- bunker signs and entrance at vector3(1493.74, 2202.9, 81.18)
    {x = 1558.5, y = 2210.8, z = 78.98,  model = "gr_prop_gr_sign_01e"},
    {x = 1567.02, y = 2231.47, z = 78.0, model = "gr_prop_gr_sign_01c"},
    {x = 1566.84, y = 2232.92, z = 77.83, model = "gr_prop_gr_sign_01b"},
    {x = 1568.53, y = 2237.64, z = 78.97, model = "gr_prop_gr_bunkeddoor_f"},
    {x = 1576.03, 2232.03, z = 77.88, model = "gr_prop_gr_sign_01c"}
    -- {x = 1287.77, y = -1720.85, z = 54.83, model = "prop_forsale_sign_03"}
}

CreateThread(function()
    while true do
        for k, v in pairs(objects) do
            local ent = GetClosestObjectOfType(objects[k].x, objects[k].y, objects[k].z, 2.0, GetHashKey(objects[k].model), false, false, false)

            SetEntityAsMissionEntity(ent, 1, 1)
            DeleteObject(ent)
            SetEntityAsNoLongerNeeded(ent)
        end

        Wait(5000)
    end
end)
