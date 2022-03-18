-- Online Interiors IPL Edits
-- Use https://github.com/Bob74/bob74_ipl/wiki to edit below


-- Nightclub Exteriors (N/A)
Citizen.CreateThread(function()
    -- Getting the object to interact with
    AfterHoursNightclubs = exports['bob74_ipl']:GetAfterHoursNightclubsObject()
    -- Exterior IPL
    AfterHoursNightclubs.Mesa.Barrier.Enable(true)
    AfterHoursNightclubs.Mesa.Posters.Enable(AfterHoursNightclubs.Posters, true)
    AfterHoursNightclubs.Mesa.Posters.Enable(AfterHoursNightclubs.Posters.forSale, false)
    
    AfterHoursNightclubs.MissionRow.Barrier.Enable(true)
    AfterHoursNightclubs.MissionRow.Posters.Enable(AfterHoursNightclubs.Posters, true)
    AfterHoursNightclubs.MissionRow.Posters.Enable(AfterHoursNightclubs.Posters.forSale, false)

    AfterHoursNightclubs.Strawberry.Barrier.Enable(true)
    AfterHoursNightclubs.Strawberry.Posters.Enable(AfterHoursNightclubs.Posters, true)
    AfterHoursNightclubs.Strawberry.Posters.Enable(AfterHoursNightclubs.Posters.forSale, false)

    AfterHoursNightclubs.VinewoodWest.Barrier.Enable(true)
    AfterHoursNightclubs.VinewoodWest.Posters.Enable(AfterHoursNightclubs.Posters, true)
    AfterHoursNightclubs.VinewoodWest.Posters.Enable(AfterHoursNightclubs.Posters.forSale, false)

    AfterHoursNightclubs.Cypress.Barrier.Enable(true)
    AfterHoursNightclubs.Cypress.Posters.Enable(AfterHoursNightclubs.Posters, true)
    AfterHoursNightclubs.Cypress.Posters.Enable(AfterHoursNightclubs.Posters.forSale, false)

    AfterHoursNightclubs.DelPerro.Barrier.Enable(true)
    AfterHoursNightclubs.DelPerro.Posters.Enable(AfterHoursNightclubs.Posters, true)
    AfterHoursNightclubs.DelPerro.Posters.Enable(AfterHoursNightclubs.Posters.forSale, false)

    AfterHoursNightclubs.Airport.Barrier.Enable(true)
    AfterHoursNightclubs.Airport.Posters.Enable(AfterHoursNightclubs.Posters, true)
    AfterHoursNightclubs.Airport.Posters.Enable(AfterHoursNightclubs.Posters.forSale, false)

    AfterHoursNightclubs.Elysian.Barrier.Enable(true)
    AfterHoursNightclubs.Elysian.Posters.Enable(AfterHoursNightclubs.Posters, true)
    AfterHoursNightclubs.Elysian.Posters.Enable(AfterHoursNightclubs.Posters.forSale, false)

    AfterHoursNightclubs.Vinewood.Barrier.Enable(true)
    AfterHoursNightclubs.Vinewood.Posters.Enable(AfterHoursNightclubs.Posters, true)
    AfterHoursNightclubs.Vinewood.Posters.Enable(AfterHoursNightclubs.Posters.forSale, false)
    
    AfterHoursNightclubs.Vespucci.Barrier.Enable(true)
    AfterHoursNightclubs.Vespucci.Posters.Enable(AfterHoursNightclubs.Posters, true)
    AfterHoursNightclubs.Vespucci.Posters.Enable(AfterHoursNightclubs.Posters.forSale, false)
end)
 