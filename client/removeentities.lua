local objects = {
    {x = 266.09, y = -349.35, z = 44.74, model = "prop_sec_barier_02b"}, 
    {x = 285.28, y = -355.78, z = 45.13, model = "prop_sec_barier_02a"}, 
    {x = 206.83, y = -803.22, z = 31.00, model = "prop_sec_barrier_ld_01a"},
    {x = 206.83, y = -803.22, z = 31.00, model = "prop_sec_barier_base_01"},
    {x = 231.21, y = -816.54, z = 30.77, model = "prop_sec_barrier_ld_01a"},
    {x = 231.21, y = -816.54, z = 30.77, model = "prop_sec_barier_base_01"},
    {x = 223.86, y = -740.73, z = 34.26, model = "prop_sec_barrier_ld_01a"},
    {x = 223.86, y = -740.73, z = 34.26, model = "prop_sec_barier_base_01"},
    {x = 996.17, y = 51.69, z = 68.45, model = "vw_prop_casino_3cardpoker_01"},
    {x = 1000.66, y = 50.88, z = 68.45, model = "vw_prop_casino_3cardpoker_01"},
    {x = 998.44, y = 60.99, z = 68.45, model = "vw_prop_casino_3cardpoker_01"},
    {x = 994.89, y = 58.29, z = 68.45, model = "vw_prop_casino_3cardpoker_01"}
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
