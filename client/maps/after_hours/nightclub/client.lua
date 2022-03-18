-- Online Interiors IPL Edits
-- Use https://github.com/Bob74/bob74_ipl/wiki to edit below


-- Nightclub (Mission Row)
Citizen.CreateThread(function()
    -- Getting the object to interact with
    AfterHoursNightclubs = exports['bob74_ipl']:GetAfterHoursNightclubsObject()

    -------------------------------------------
    AfterHoursNightclubs.Ipl.Interior.Load()
        
    AfterHoursNightclubs.Interior.Name.Set(AfterHoursNightclubs.Interior.Name.paradise)
    AfterHoursNightclubs.Interior.Style.Set(AfterHoursNightclubs.Interior.Style.glam)

    AfterHoursNightclubs.Interior.Podium.Set(AfterHoursNightclubs.Interior.Podium.glam)
    AfterHoursNightclubs.Interior.Speakers.Set(AfterHoursNightclubs.Interior.Speakers.upgrade)

    AfterHoursNightclubs.Interior.Security.Set(AfterHoursNightclubs.Interior.Security.on)
    
    AfterHoursNightclubs.Interior.Turntables.Set(AfterHoursNightclubs.Interior.Turntables.style03)
    AfterHoursNightclubs.Interior.Lights.Bands.Set(AfterHoursNightclubs.Interior.Lights.Bands.yellow)
    AfterHoursNightclubs.Interior.Lights.Droplets.Set(AfterHoursNightclubs.Interior.Lights.Droplets.white)
    AfterHoursNightclubs.Interior.Lights.Neons.Set(AfterHoursNightclubs.Interior.Lights.Neons.cyan)
    AfterHoursNightclubs.Interior.Lights.Lasers.Set(AfterHoursNightclubs.Interior.Lights.Lasers.green)

    AfterHoursNightclubs.Interior.Bar.Enable(true)

    AfterHoursNightclubs.Interior.Booze.Enable(AfterHoursNightclubs.Interior.Booze, true)

    AfterHoursNightclubs.Interior.Trophy.Enable(AfterHoursNightclubs.Interior.Trophy.dancer, true, AfterHoursNightclubs.Interior.Trophy.Color.silver)
    AfterHoursNightclubs.Interior.DryIce.Enable(true)
    AfterHoursNightclubs.Interior.Details.Enable(AfterHoursNightclubs.Interior.Details.dryIce, true)
    AfterHoursNightclubs.Interior.Details.Enable(AfterHoursNightclubs.Interior.Details.truck, true)
    AfterHoursNightclubs.Interior.Details.Enable(AfterHoursNightclubs.Interior.Details.vaultCash, true)

    RefreshInterior(AfterHoursNightclubs.interiorId)


   

end)