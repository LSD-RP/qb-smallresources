Config = {}
Config.MaxWidth = 5.0
Config.MaxHeight = 5.0
Config.MaxLength = 5.0
Config.DamageNeeded = 500.0
Config.IdleCamera = true
Config.EnableProne = true
Config.JointEffectTime = 60
Config.RemoveWeaponDrops = true
Config.RemoveWeaponDropsTimer = 25
Config.DefaultPrice = 20 -- Default price for the carwash
Config.DirtLevel = 0.1 -- Threshold for the dirt level to be counted as dirty
Config.DisableAmbience = false -- Disabled distance sirens, distance car alarms, etc

ConsumeablesEat = {
    ["sandwich"] = math.random(35, 54),
    ["tosti"] = math.random(40, 50),
    ['cheesecake'] = math.random(40, 50),
    ['caramellatte'] = math.random(40, 50),
    ['baconeggncheese'] = math.random(40, 50),
    ['bfburrito'] = math.random(40, 50),
    ["twerks_candy"] = math.random(35, 54),
    ["snikkel_candy"] = math.random(40, 50),

    ["burger-bleeder"] = math.random(35, 54),
    ["burger-moneyshot"] = math.random(35, 54),
    ["burger-torpedo"] = math.random(35, 54),
    ["burger-heartstopper"] = math.random(35, 54),
    ["burger-meatfree"] = math.random(35, 54),
    ["burger-fries"] = math.random(35, 54),

    ["cooked_meat"] = math.random(75,100),
    ["cutfish"] = math.random(35,54),

    ["chocolate-froyo"] = math.random(35,54),
    ["vanilla-froyo"] = math.random(35,54),
    ["berry-froyo"] = math.random(35,54),
    ["oreo-froyo"] = math.random(35,54),
    ["strawberry-froyo"] = math.random(35,54),
    ["banana-froyo"] = math.random(35,54),
    ["pineapple-froyo"] = math.random(35,54),
}

ConsumeablesDrink = {
    ["water_bottle"] = math.random(35, 54),
    ["kurkakola"] = math.random(35, 54),
    ["sprunk"] = math.random(35, 54),
    ["coffee"] = math.random(40, 50),
    --Drinks
    ["burger-softdrink"] = math.random(40, 50),
    ["burger-mshake"] = math.random(40, 50),
    
    ["koolaid"] = math.random(35, 54),
    ["greentea"] = math.random(35, 54),
    ["caramellatte"] = math.random(35, 54),
    ["espressoshot"] = math.random(35, 54),
    ["americano"] = math.random(35, 54),
    ["pepmocha"] = math.random(35, 54),

    ["banana-smoothie"] = math.random(35, 54),
    ["mango-smoothie"] = math.random(35, 54),
    ["strawberry-smoothie"] = math.random(35, 54),
    ["pineapple-smoothie"] = math.random(35, 54),
    ["orange-smoothie"] = math.random(35, 54),
    ["lemon-smoothie"] = math.random(35, 54),
    ["kiwi-smoothie"] = math.random(35, 54),
    ["dragonfruit-smoothie"] = math.random(35, 54),
    
    ["bobatea"] = math.random(35, 54),
    ["herbaltea"] = math.random(35, 54),
    ["chamomiletea"] = math.random(35, 54),
    ["sweetblacktea"] = math.random(35, 54),
    ["unsweetblacktea"] = math.random(35, 54),
    ["mangotea"] = math.random(35, 54),
    ["lemontea"] = math.random(35, 54),
    ["passionfruittea"] = math.random(35, 54),
    ["peachtea"] = math.random(35, 54),
    ["minttea"] = math.random(35, 54),
    
    ["blue-slushie"] = math.random(35, 54),
    ["red-slushie"] = math.random(35, 54),
    ["green-slushie"] = math.random(35, 54),
    ["white-slushie"] = math.random(35, 54),
    
    ["chocolate-milkshake"] = math.random(35, 54),
    ["vanilla-milkshake"] = math.random(35, 54),
    ["strawberry-milkshake"] = math.random(35, 54),

}

ConsumeablesAlcohol = {
    ["whiskey"] = math.random(20, 30),
    ["beer"] = math.random(30, 40),
    ["vodka"] = math.random(20, 40),
    ["rum"] = math.random(20,40),
}

ConsumeablesFireworks = {
    "firework1",
    "firework2",
    "firework3",
    "firework4"
}

Config.BlacklistedScenarios = {
    ['TYPES'] = {
        "WORLD_VEHICLE_MILITARY_PLANES_SMALL",
        "WORLD_VEHICLE_MILITARY_PLANES_BIG",
        "WORLD_VEHICLE_AMBULANCE",
        "WORLD_VEHICLE_POLICE_NEXT_TO_CAR",
        "WORLD_VEHICLE_POLICE_CAR",
        "WORLD_VEHICLE_POLICE_BIKE",
    },
    ['GROUPS'] = {
        2017590552,
        2141866469,
        1409640232,
        `ng_planes`,
    }
}

Config.BlacklistedVehs = {
    [`SHAMAL`] = false,
    [`LUXOR`] = false,
    [`LUXOR2`] = false,
    [`JET`] = false,
    [`LAZER`] = false,
    [`BUZZARD`] = false,
    [`BUZZARD2`] = false,
    [`ANNIHILATOR`] = false,
    [`SAVAGE`] = false,
    [`TITAN`] = false,
    [`RHINO`] = false,
    [`FIRETRUK`] = false,
    [`MULE`] = false,
    [`MAVERICK`] = false,
    [`BLIMP`] = false,
    [`AIRTUG`] = false,
    [`CAMPER`] = false,
    [`HYDRA`] = false,
    [`OPPRESSOR`] = false,
    [`technical3`] = false,
    [`insurgent3`] = false,
    [`apc`] = false,
    [`tampa3`] = false,
    [`trailersmall2`] = false,
    [`halftrack`] = false,
    [`hunter`] = false,
    [`vigilante`] = false,
    [`akula`] = false,
    [`barrage`] = false,
    [`khanjali`] = false,
    [`caracara`] = false,
    [`blimp3`] = false,
    [`menacer`] = false,
    [`oppressor2`] = false,
    [`scramjet`] = false,
    [`strikeforce`] = false,
    [`cerberus`] = false,
    [`cerberus2`] = false,
    [`cerberus3`] = false,
    [`scarab`] = false,
    [`scarab2`] = false,
    [`scarab3`] = false,
    [`rrocket`] = false,
    [`ruiner2`] = false,
    [`deluxo`] = false,
}

Config.BlacklistedPeds = {
    [`s_m_y_ranger_01`] = true,
    [`s_m_y_sheriff_01`] = true,
    [`s_m_y_cop_01`] = true,
    [`s_f_y_sheriff_01`] = true,
    [`s_f_y_cop_01`] = true,
    [`s_m_y_hwaycop_01`] = true,
}

Config.Teleports = {
    --Elevator @ labs
    [1] = {
        [1] = {
            coords = vector4(3540.74, 3675.59, 20.99, 167.5),
            ["AllowVehicle"] = false,
            drawText = '[E] Take Elevator Up'
        },
        [2] = {
            coords = vector4(3540.74, 3675.59, 28.11, 172.5),
            ["AllowVehicle"] = false,
            drawText = '[E] Take Elevator Down'
        },

    },
    --Coke Processing Enter/Exit
    -- [2] = {
    --     [1] = {
    --         coords = vector4(909.49, -1589.22, 30.51, 92.24),
    --         ["AllowVehicle"] = false,
    --         drawText = '[E] Enter Coke Processing'
    --     },
    --     [2] = {
    --         coords = vector4(1088.81, -3187.57, -38.99, 181.7),
    --         ["AllowVehicle"] = false,
    --         drawText = '[E] Leave'
    --     },
    -- },
    [3] = {
        [1] = {
            coords = vector4(-140.5, -620.44, 168.82, 185.45),
            ["AllowVehicle"] = false,
            drawText = '[E] Leave Realtor Office',
        },
        [2] = {
            coords = vector4(-117.19, -604.65, 36.28, 202.18),
            ["AllowVehicle"] = false,
            drawText = '[E] Enter Realtor Office',
        }
    },
    [4] = {
        [1] = {
            coords = vector4(2844.99, -3919.02, 140.0, 351.18),
            ["AllowVehicle"] = false,
            drawText = '[E] Exit arena'
        },
        [2] = {
            coords = vector4(-278.81, -1926.15, 29.95, 289.72),
            ["AllowVehicle"] = false,
            drawText = '[E] Enter arena',
        }
    },
    [5] = {
        [1] = {
            coords = vector4(2844.64, -3680.93, 140.0, 205.89),
            ["AllowVehicle"] = false,
            drawText = '[E] Exit arena'
        },
        [2] = {
            coords = vector4(-282.8, -1922.7, 29.95, 297.92),
            ["AllowVehicle"] = false,
            drawText = '[E] Enter arena',
        }
    },
    [6] = {
        [1] = {
            coords = vector4(2754.97, -3681.82, 140.0, 174.02),
            ["AllowVehicle"] = false,
            drawText = '[E] Exit arena'
        },
        [2] = {
            coords = vector4(-285.69, -1919.92, 29.95, 348.02),
            ["AllowVehicle"] = false,
            drawText = '[E] Enter arena',
        }
    },
    [7] = {
        [1] = {
            coords = vector4(2755.1, -3918.62, 140.0, 0.17),
            ["AllowVehicle"] = false,
            drawText = '[E] Exit arena'
        },
        [2] = {
            coords = vector4(-290.43, -1916.2, 29.95, 339.67),
            ["AllowVehicle"] = false,
            drawText = '[E] Enter arena',
        }
    },
    [8] = {
        [1] = {
            coords = vector4(999.05, -53.19, 74.95,211.72),
            ["AllowVehicle"] = true,
            drawText = '[E] Enter Casino Loading bay'
        },
        [2] = {
            coords = vector4(1046.49, -106.96, 65.84, 14.06),
            ["AllowVehicle"] = true,
            drawText = '[E] Exit Casino Loading bay',
        }
    },
    [9] = {
        [1] = {
            coords = vector4(-1423.6, -215.54, 46.2, 360),
            ["AllowVehicle"] = false,
            drawText = '[E] Enter Movie Theater'
        },
        [2] = {
            coords = vector4(-1436.89, -257.8, 16.09, 359.81),
            ["AllowVehicle"] = false,
            drawText = '[E] Exit Movie Theater',
        }
    },
    -- [10] = {
    --     [1] = {
    --         coords = vector4(-430.06, 261.72, 83.0, 170.49),
    --         ["AllowVehicle"] = false,
    --         drawText = '[E] Enter Comedy Club'
    --     },
    --     [2] = {
    --         coords = vector4(-458.85, 284.66, 78.5, 266.75),
    --         ["AllowVehicle"] = false,
    --         drawText = '[E] Exit Comedy Club',
    --     }
    -- },
    [11] = {
        [1] = {
            coords = vector4(-1569.37, -3017.17, -74.41, 0.32),
            ["AllowVehicle"] = false,
            drawText = '[E] Exit Night Club'
        },
        [2] = {
            coords = vector4(346.02, -977.81, 29.37, 277.02),
            ["AllowVehicle"] = false,
            drawText = '[E] Enter Night Club',
        }
    },
    [12] = {
        [1] = {
            coords = vector4(1121.05, -3152.13, -37.07, 355.17),
            ["AllowVehicle"] = false,
            drawText = '[E] Exit Sandy Shores Clubhouse'
        },
        [2] = {
            coords = vector4(1737.78, 3709.59, 34.14, 20.94),
            ["AllowVehicle"] = false,
            drawText = '[E] Enter Sandy Shores Clubhouse',
        }
    },
    [13] = {
        [1] = {
            coords = vector4(997.25, -3158.10, -38.91, 268.83),
            ["AllowVehicle"] = false,
            drawText = '[E] Exit Paleto Bay Clubhouse'
        },
        [2] = {
            coords = vector4(-38.47, 6419.88, 31.49, 231.76),
            ["AllowVehicle"] = false,
            drawText = '[E] Enter Paleto Bay Clubhouse',
        }
    },
    [14] = {
        [1] = {
            coords = vector4(1088.66, -3187.66, -38.99, 177.66),
            ["AllowVehicle"] = false,
            drawText = '[E] Exit Cocaine Lockup'
        },
        [2] = {
            coords = vector4(51.92, 6486.31, 31.43, 318.31),
            ["AllowVehicle"] = false,
            drawText = '[E] Enter Cocaine Lockup',
        }
    },
    -- [15] = {
    --     [1] = {
    --         coords = vector4(1103.32, -3195.89, -38.99, 89.39),
    --         ["AllowVehicle"] = false,
    --         drawText = '[E] Exit Cocaine Lockup'
    --     },
    --     [2] = {
    --         coords = vector4(56.73, 6471.21, 31.43, 228.98),
    --         ["AllowVehicle"] = false,
    --         drawText = '[E] Enter Cocaine Lockup',
    --     }
    -- },
    [16] = {
        [1] = {
            coords = vector4(1138.21, -3198.80, -39.67, 357.07),
            ["AllowVehicle"] = false,
            drawText = '[E] Exit Counterfeit Cash Factory'
        },
        [2] = {
            coords = vector4(-1170.99, -1380.93, 4.96, 30.09),
            ["AllowVehicle"] = false,
            drawText = '[E] Enter Counterfeit Cash Factory',
        }
    },
    -- [17] = {
    --     [1] = {
    --         coords = vector4(1118.72, -3193.27, -40.40, 177.34),
    --         ["AllowVehicle"] = false,
    --         drawText = '[E] Exit Counterfeit Cash Factory'
    --     },
    --     [2] = {
    --         coords = vector4(-1168.95, -1388.90, 4.92, 131.87),
    --         ["AllowVehicle"] = false,
    --         drawText = '[E] Enter Counterfeit Cash Factory',
    --     }
    -- },
    [17] = {
        [1] = {
            coords = vector4(1173.50, -3196.66, -39.01, 88.37),
            ["AllowVehicle"] = false,
            drawText = '[E] Exit Document Forgery Office'
        },
        [2] = {
            coords = vector4(1643.77, 4857.89, 42.01, 96.51),
            ["AllowVehicle"] = false,
            drawText = '[E] Enter Document Forgery Office',
        }
    },
    [18] = {
        [1] = {
            coords = vector4(1180.88, -3113.84, 6.03, 99.59),
            ["AllowVehicle"] = false,
            drawText = '[E] Enter Meth Lab'
        },
        [2] = {
            coords = vector4(997.49, -3200.70, -36.40, 274.34),
            ["AllowVehicle"] = false,
            drawText = '[E] Exit Meth Lab',
        }
    },
    [16] = {
        [1] = {
            coords = vector4(102.07, 175.09, 104.59, 165.63),
            ["AllowVehicle"] = false,
            drawText = '[E] Enter Weed Farm'
        },
        [2] = {
            coords = vector4(1066.01, -3183.38, -39.16, 93.01),
            ["AllowVehicle"] = false,
            drawText = '[E] Exit Weed Farm',
        }
    },
    [19] = {
        [1] = {
            coords = vector4(-666.58, -2379.13, 13.87, 61.39),
            ["AllowVehicle"] = true,
            drawText = '[E] Enter Vehicle Warehouse'
        },
        [2] = {
            coords = vector4(970.83, -2990.88, -39.65, 179.69),
            ["AllowVehicle"] = true,
            drawText = '[E] Exit Vehicle Warehouse',
        }
    },
    [20] = {
        [1] = {
            coords = vector4(-673.56, -2391.19, 13.87, 60.95),
            ["AllowVehicle"] = true,
            drawText = '[E] Enter Vehicle Warehouse Modshop'
        },
        [2] = {
            coords = vector4(954.89, -2991.19, -39.65, 180.23),
            ["AllowVehicle"] = true,
            drawText = '[E] Exit Vehicle Warehouse Modshop',
        }
    },
    [21] = {
        [1] = {
            coords = vector4(978.25, -3002.00, -39.65, 90.23),
            ["AllowVehicle"] = true,
            drawText = '[E] Enter Vehicle Warehouse Basement'
        },
        [2] = {
            coords = vector4(946.57, -2999.03, -47.65,  269.91),
            ["AllowVehicle"] = true,
            drawText = '[E] Exit Vehicle Warehouse Basement',
        }
    },
    [22] = {
        [1] = {
            coords = vector4(2489.78, 3160.71, 49.08, 189.98),
            ["AllowVehicle"] = true,
            drawText = '[E] Enter Bunker'
        },
        [2] = {
            coords = vector4(890.55, -3245.86, -98.27, 91.61),
            ["AllowVehicle"] = true,
            drawText = '[E] Exit Bunker',
        }
    },
    [23] = {
        [1] = {
            coords = vector4(1.79, 6832.14, 15.82, 248.36),
            ["AllowVehicle"] = true,
            drawText = '[E] Enter Paleto Bay Facility'
        },
        [2] = {
            coords = vector4(482.67, 4812.92, -58.38,13.05),
            ["AllowVehicle"] = true,
            drawText = '[E] Exit Paleto Bay Facility',
        }
    },
    -- [24] = {
    --     [1] = {
    --         coords = vector4(4.10, 220.42, 107.5, 250.43),
    --         ["AllowVehicle"] = false,
    --         drawText = '[E] Enter Arcade'
    --     },
    --     [2] = {
    --         coords = vector4(2737.96, -374.11, -48.0, 174.4),
    --         ["AllowVehicle"] = false,
    --         drawText = '[E] Exit Arcade',
    --     }
    -- },
    [25] = {
        [1] = {
            coords = vector4(-356.04, 4823.27, 142.74, 138.58),
            ["AllowVehicle"] = true,
            drawText = '[E] Enter Doomsday Facility'
        },
        [2] = {
            coords = vector4(1255.97, 4796.37, -39.24, 346.87),
            ["AllowVehicle"] = true,
            drawText = '[E] Exit Doomsday Facility',
        }
    },
    [26] = {
        [1] = {
            coords = vector4(1259.31, 4799.19, -39.5, 78.22),
            ["AllowVehicle"] = false,
            drawText = '[E] Enter Missile Silo'
        },
        [2] = {
            coords = vector4(369.49, 6319.51, -160.12, 200.0),
            ["AllowVehicle"] = false,
            drawText = '[E] Exit Missile Silo',
        }
    },
    [27] = {
        [1] = {
            coords = vector4(987.57, 79.82, 80.99, 330.39),
            ["AllowVehicle"] = false,
            drawText = '[E] Enter Music Locker'
        },
        [2] = {
            coords = vector4(1578.25, 253.86, -46.01, 181.46),
            ["AllowVehicle"] = false,
            drawText = '[E] Exit Music Locker',
        }
    },
    -- [28] = {
    --     [1] = {
    --         coords = vector4(798.51, -962.21, 25.97,  92.76),
    --         ["AllowVehicle"] = true,
    --         drawText = '[E] Enter Tuners Car Garage'
    --     },
    --     [2] = {
    --         coords = vector4(-1357.85, 165.96, -99.03, 184.89),
    --         ["AllowVehicle"] = true,
    --         drawText = '[E] Exit Tuners Car Garage',
    --     }
    -- },
    [29] = {
        [1] = {
            coords = vector4(782.47, -1868.65, 29.25, 266.53),
            ["AllowVehicle"] = true,
            drawText = '[E] Enter Tuners Car Car Meet'
        },
        [2] = {
            coords = vector4(-2220.81, 1157.72, -23.26, 182.38),
            ["AllowVehicle"] = true,
            drawText = '[E] Exit Tuners Car Car Meet',
        }
    },
    [30] = {
        [1] = {
            coords = vector4(-490.47, -327.42, 69.51, 167.74),
            ["AllowVehicle"] = false,
            drawText = '[E] Go To Main Floor'
        },
        [2] = {
            coords = vector4(-490.52, -327.39, 42.31, 159.7),
            ["AllowVehicle"] = false,
            drawText = '[E] Go To Offices/In-Patient',
        }
    },
    [31] = {
        [1] = {
            coords = vector4(-439.51, -335.94, 78.3, 85.76),
            ["AllowVehicle"] = false,
            drawText = '[E] Go To Main Floor'
        },
        [2] = {
            coords = vector4(-493.52, -327.27, 42.31, 168.25),
            ["AllowVehicle"] = false,
            drawText = '[E] Go To Roof',
        }
    },
    [32] = {
        [1] = {
            coords = vector4(-449.07, -334.58, 78.3, 264.13),
            ["AllowVehicle"] = false,
            drawText = '[E] Go To Main Offices/In-Patient'
        },
        [2] = {
            coords = vector4(-493.73, -327.25, 69.5, 175.57),
            ["AllowVehicle"] = false,
            drawText = '[E] Go To Roof',
        }
    },
    [33] = {
        [1] = {
            coords = vector4(-436.14, -359.58, 34.95, 350.53),
            ["AllowVehicle"] = false,
            drawText = '[E] Go To Garage'
        },
        [2] = {
            coords = vector4(-418.9, -344.73, 24.23, 112.39),
            ["AllowVehicle"] = false,
            drawText = '[E] Go To Main Floor',
        }
    },
    [34] = {
        [1] = {
            coords = vector4(-452.63, -288.4, -130.84, 115.36),
            ["AllowVehicle"] = false,
            drawText = '[E] Go To Reception'
        },
        [2] = {
            coords = vector4(-487.57, -328.16, 42.31, 174.55),
            ["AllowVehicle"] = false,
            drawText = '[E] Go To Operations',
        }
    },
    [35] = {
        [1] = {
            coords = vector4(-1229.71, -286.08, 37.74, 207.95),
            ["AllowVehicle"] = false,
            drawText = '[E] Enter'
        },
        [2] = {
            coords = vector4(-1230.4, -284.48, 37.77, 48.28),
            ["AllowVehicle"] = false,
            drawText = '[E] Exit',
        }
    },
    [36] = {
        [1] = {
            coords = vector4(330.28, -601.13, 43.28, 69.97),
            ["AllowVehicle"] = false,
            drawText = '[E] To Roof'
        },
        [2] = {
            coords = vector4(338.77, -583.98, 74.16, 252.95),
            ["AllowVehicle"] = false,
            drawText = '[E] Enter',
        }
    },
    [37] = {
        [1] = {
            coords = vector4(332.14, -595.56, 43.28, 75.2),
            ["AllowVehicle"] = false,
            drawText = '[E] Down'
        },
        [2] = {
            coords = vector4(344.5, -586.35, 28.8, 245.38),
            ["AllowVehicle"] = false,
            drawText = '[E] Up',
        }
    },
    [38] = {
        [1] = {
            coords = vector4(327.31, -603.67, 43.28, 351.65),
            ["AllowVehicle"] = false,
            drawText = '[E] Morgue'
        },
        [2] = {
            coords = vector4(279.41, -1349.09, 24.54, 320.31),
            ["AllowVehicle"] = false,
            drawText = '[E] Hospital',
        }
    },
    [39] = {
        [1] = {
            coords = vector4(-1022.07, -92.11, -99.4, 354.7),
            ["AllowVehicle"] = false,
            drawText = '[E] Exit'
        },
        [2] = {
            coords = vector4(-839.96, -231.96, 37.24, 298.8),
            ["AllowVehicle"] = false,
            drawText = '[E] Enter Recording Studio',
        }
    },
    [40] = {
        [1] = {
            coords = vector4(-843.46, -236.66, 61.02, 27.78),
            ["AllowVehicle"] = false,
            drawText = '[E] Exit'
        },
        [2] = {
            coords = vector4(-1010.5, -48.63, -99.4, 194.73),
            ["AllowVehicle"] = false,
            drawText = '[E] To Rooftop',
        }
    },
    [41] = {
        [1] = {
            coords = vector4(-1357.7, 165.47, -99.08, 177.49),
            ["AllowVehicle"] = true,
            drawText = '[E] Exit'
        },
        [2] = {
            coords = vector4(-1357.7, 165.47, -99.08, 177.49),
            ["AllowVehicle"] = true,
            drawText = '[E] To Tuners Garage',
        }
    },
    [42] = {
        [1] = {
            coords = vector4(-1639.4, -3012.25, -78.14, 3.98),
            ["AllowVehicle"] = true,
            drawText = '[E] Exit'
        },
        [2] = {
            coords = vector4(-1478.16, -3285.87, 13.94, 132.04),
            ["AllowVehicle"] = true,
            drawText = '[E] To Paradise Garage',
        }
    },
    [43] = {
        [1] = {
            coords = vector4(844.11, -3005.2, -44.4, 276.1),
            ["AllowVehicle"] = false,
            drawText = '[E] Exit'
        },
        [2] = {
            coords = vector4(1384.32, -2079.85, 52.41, 224.78),
            ["AllowVehicle"] = true,
            drawText = '[E] To Warehouse',
        }
    },
    [44] = {
        [1] = {
            coords = vector4(815.53, -3001.7, -69.0, 90.28),
            ["AllowVehicle"] = true,
            drawText = '[E] Exit'
        },
        [2] = {
            coords = vector4(-84.13, -820.12, 36.03, 342.67),
            ["AllowVehicle"] = true,
            drawText = '[E] To Vehicle Warehouse',
        }
    }
}

Config.Teleports2 = {
    --teleport to red desert island
    [1] = {
        [1] = {
            coords = vector4(6623.3, -765.29, 23.78, 36.16),
            ["AllowVehicle"] = true,
            drawText = '[E] Take Ship to Mainland',
            color = vector3(255, 156, 51)
        },
        [2] = {
            coords = vector4(848.52, -2905.83, 5.9, 179.29),
            ["AllowVehicle"] = true,
            drawText = '[E] Take Ship to Desert Island',
            color = vector3(255, 156, 51)
        },

    },
    -- to cayo perico
    [2] = {
        [1] = {
            coords = vector4(4976.74, -5172.86, 2.46, 248.93),
            ["AllowVehicle"] = true,
            drawText = '[E] Take Ship to Mainland',
            color = vector3(60, 233, 168)
        },
        [2] = {
            coords = vector4(860.24, -2905.72, 5.9, 181.22),
            ["AllowVehicle"] = true,
            drawText = '[E] Take Ship to Cayo Perico Island',
            color = vector3(60, 233, 168)
        },

    }
}

Config.CarWash = { -- carwash
    [1] = {
        ["label"] = "Hands Free Carwash",
        ["coords"] = vector3(25.29, -1391.96, 29.33),
    },
    [2] = {
        ["label"] = "Hands Free Carwash",
        ["coords"] = vector3(174.18, -1736.66, 29.35),
    },
    [3] = {
        ["label"] = "Hands Free Carwash",
        ["coords"] = vector3(-74.56, 6427.87, 31.44),
    },
    [4] = {
        ["label"] = "Hands Free Carwash",
        ["coords"] = vector3(1363.22, 3592.7, 34.92),
    },
    [5] = {
        ["label"] = "Hands Free Carwash",
        ["coords"] = vector3(-699.62, -932.7, 19.01),
    }
}

Config.AllLogs = true											-- Enable/Disable All Logs Channel
Config.postal = true  											-- set to false if you want to disable nerest postal (https://forum.cfx.re/t/release-postal-code-map-minimap-new-improved-v1-2/147458)
Config.username = "LSD Logs" 							-- Bot Username
Config.avatar = "https://i.imgur.com/aCvIWHv.gif"				-- Bot Avatar
Config.communtiyName = "LSD Legacy"					-- Icon top of the Embed
Config.communtiyLogo = "https://i.imgur.com/aCvIWHv.gif"		-- Icon top of the Embed


Config.weaponLog = true  			-- set to false to disable the shooting weapon logs
Config.weaponLogDelay = 1000		-- delay to wait after someone fired a weapon to check again in ms (put to 0 to disable) Best to keep this at atleast 1000

Config.playerID = true				-- set to false to disable Player ID in the logs
Config.steamID = true				-- set to false to disable Steam ID in the logs
Config.steamURL = true				-- set to false to disable Steam URL in the logs
Config.discordID = true				-- set to false to disable Discord ID in the logs


-- Change color of the default embeds here
-- It used Decimal color codes witch you can get and convert here: https://jokedevil.com/colorPicker
Config.joinColor = "3863105" 		-- Player Connecting
Config.leaveColor = "15874618"		-- Player Disconnected
Config.chatColor = "10592673"		-- Chat Message
Config.shootingColor = "10373"		-- Shooting a weapon
Config.deathColor = "000000"		-- Player Died
Config.serverstatus = "00ff33"	-- server Stopped/Started
Config.resourceColor = "15461951"	-- Resource Stopped/Started
