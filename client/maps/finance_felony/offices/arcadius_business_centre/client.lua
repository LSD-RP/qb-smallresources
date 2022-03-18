-- Online Interiors IPL Edits
-- Use https://github.com/Bob74/bob74_ipl/wiki to edit below

-- Arcadius Business Centre (Downtown Los Santos)
Citizen.CreateThread(function()
    -- Getting the object to interact with
	FinanceOffice1 = exports['bob74_ipl']:GetFinanceOffice1Object()


    FinanceOffice1.Style.Set(FinanceOffice1.Style.Theme.rich)
    FinanceOffice1.Chairs.Set(FinanceOffice1.Chairs.on, true)
    FinanceOffice1.Swag.Enable(FinanceOffice1.Swag.Cash, FinanceOffice1.Swag.Cash.M, true)
    -- FinanceOffice1.Swag.Enable(FinanceOffice1.Swag.DrugBags, FinanceOffice1.Swag.DrugBags.C, true)
    -- FinanceOffice1.Swag.Enable(FinanceOffice1.Swag.FurCoats, FinanceOffice1.Swag.FurCoats.C, true)
    -- FinanceOffice1.Swag.Enable(FinanceOffice1.Swag.Painting, FinanceOffice1.Swag.Painting.C, true)
    -- FinanceOffice1.Swag.Enable(FinanceOffice1.Swag.Gems, FinanceOffice1.Swag.Gems.C, true)
    FinanceOffice1.Booze.Set(FinanceOffice1.Booze.on, true)

    -- -- Set the office theme to "conservative"
    -- FinanceOffice1.Style.Set(FinanceOffice1.Style.Theme.conservative, true)

    -- -- Enable chairs in the office
    -- FinanceOffice1.Chairs.Set(FinanceOffice1.Chairs.on, true)

    -- -- Disabling booze bottles
    -- FinanceOffice1.Booze.Clear(true)

	-- Refresh Interior
    RefreshInterior(FinanceOffice1.currentInteriorId)
	
end)