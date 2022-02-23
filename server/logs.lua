local QBCore = exports['qb-core']:GetCoreObject()

local Webhooks = {
    ['default'] = 'https://discord.com/api/webhooks/931747329617309786/YyQRYfsMFnPSC88el6bGr_Ch0oBaMix2mK-Qfttr3ZLW6d4zZYtN5T1kp5socfJE6Fzh',
    ['testwebhook'] = '',
    ['playermoney'] = 'https://discord.com/api/webhooks/931747269865242694/aUT9XS-hcIMHbXEU9_W6bNHAlHWX5RwaUJbhQ-KTsblZjoW035YRw-Fmqqrj-iRyTCVN',
    ['playerinventory'] = 'https://discord.com/api/webhooks/931747215960059924/MHGTRgIyjJN7EQ5rrVgX29JWZl7NbLn_0B5YP9pCA9EeVKM1VfvXh6zY5N7vECJHvU6e',
    ['robbing'] = 'https://discord.com/api/webhooks/931747148888965211/KxtwSC6eM_XEQCtWYtwKjXZVG4mR6gnNAzjJfsSSVg8x7B-7WDu4QnShHGM31jP_FEue',
    ['cuffing'] = 'https://discord.com/api/webhooks/931747089384345661/RlU8Q64XLoU3Fr2aB3XnWBFSfNdf86DiaJIlTs7O05NN-y8awpkEzRq6yh3_L4Rs7eKD',
    ['drop'] = 'https://discord.com/api/webhooks/931747020715200512/L-Y1za_LFOMVG-LF9SilRey9IcETZt7S4FYmCOUCpgVwBIBZiVmQtOxSb_b2UcZfJkrm',
    ['trunk'] = 'https://discord.com/api/webhooks/931746970048008202/9lLNOrkgbUI68q68_iUwFNnHAfXsVpwzNJX7mWEhBSwSomdbqoUHMcoQcHKe3y-pKhqW',
    ['stash'] = 'https://discord.com/api/webhooks/931746889668382720/ST7mrLAoowAmdQ18qF81yptvCz-KncrtiCocUwtIp3xx6NVRpnv3O7WsiJDCmeaSmWmP',
    ['glovebox'] = 'https://discord.com/api/webhooks/931746834219696158/8ybEX6HtP18r5YJjRiACaONXDGnX0ukkkyVfzFYDN05gYprG1dgtgoLhJJYy_7k4yXch',
    ['banking'] = 'https://discord.com/api/webhooks/931746776812236840/zMQXNa3WhIJJU9VTsy1DN1374iQmNNz4GqSxTm53LdOYfpvvWv6_m2L4Ay2T7WpcvKTF',
    ['vehicleshop'] = 'https://discord.com/api/webhooks/931746546704334899/ykRX3u3KGqW7-dhjlVd_06N_t1Yhs7A6wR5dipbfRhLDHT7IYwY6b1vYSSaJu0fNcjI_',
    ['vehicleupgrades'] = 'https://discord.com/api/webhooks/931746650484015174/t-0gSGNbjsMd3KXilEa4ylEQkgrmbIOE3PeZybCjeM-cinlOb1jSlDSUFI7KEXSRb3Da',
    ['shops'] = 'https://discord.com/api/webhooks/931729296022728785/ryzsZU55zYcYUxYWR8QvoRuLLLszxCROfZXWI4pF7AWrF8czwJ2GA88lgdLisj6umvzV',
    ['dealers'] = 'https://discord.com/api/webhooks/931729240167161896/WIhrXr2LJ6tebfpqk_PR_alaQUjAz9sgFLu6QBuCtXlWodaTtQu0iAkhYkJQV6NoibCt',
    ['storerobbery'] = 'https://discord.com/api/webhooks/931729185473445888/EqbNPkJrG4BWEjQcueHinNuqe-sb2yApGOTxs9fhPXLnJf9wuZ-W2cLNxJmxUWUTI_aT',
    ['bankrobbery'] = 'https://discord.com/api/webhooks/931729122013630484/17AYJRHOIC3GkZdfRwMVwWqUxkf2XYip4QY_023_rrX0kRuhNsxmEqFXNPKOXpZkcY7S',
    ['powerplants'] = 'https://discord.com/api/webhooks/931729058222440458/LEzYz8irTj84Y8JGvVaDQ0xTToLNe0kxopJ-v1YUeCyQ--fMO1F5-3qAP7oj_3OUXaCy',
    ['death'] = 'https://discord.com/api/webhooks/931728987535855679/9sa5pzyKjLDgo3jr_sbB_7tbNRDYlCRWltXz5xcI7dDeZPkuK6cCvz87137mBYRH93ye',
    ['joinleave'] = 'https://discord.com/api/webhooks/931728871622082630/WOz5Bj9JLdYUN444Y0wGMYhBN9iBlrfTSJ-8BCpu7cXdZOgZSUE0qR9ETvVfsHtXXamz',
    ['ooc'] = 'https://discord.com/api/webhooks/931728807646343258/hHet-7y-QHMsfNCIs0jiRnLI7T5g0ulTgb4x77umPDOPBSivmglB1dn2ltF7gOtfIS7p',
    ['report'] = 'https://discord.com/api/webhooks/931728754403844136/uOYEzK4x-8Jzg1Ndtm9NFDZuC7rEc7CDguBpsU6DFV2wU7hPB4C4kqJzygW-9B1D1Tme',
    ['me'] = 'https://discord.com/api/webhooks/931728673218904094/iPPGZolu9pDti-p2si2HDC9Hx-9ShoLNF2rMIwV6fY9Xnmh58YiJLXpXo3xG0P-sfShO',
    ['pmelding'] = 'https://discord.com/api/webhooks/931728359526920252/tvfIRhVH_wAmak7gGXQ7VAObQcbIYJ6cBKWq2-pkNZmxeWg2UxrKhWEwI8uihPwjSRrY',
    ['112'] = 'https://discord.com/api/webhooks/931728307463000126/MT96tbNr5VbZn_7ETK59jD71DcBkgbjx1KKUtCSBLoKzFtkG_f-n37C2xk1o07hf7Ycq',
    ['bans'] = 'https://discord.com/api/webhooks/931728254165999718/wjWXYiipWsRIxoUQ0kgLmCJxfQSSagNdGr2TROcL9mVMdt42OUKVKwGUQdSD3sJkYJF5',
    ['anticheat'] = 'https://discord.com/api/webhooks/931728200273375232/U1aZHIYr2g49U1XIX37LdizeWpy0TSA1Vk9hTJ1OMvM0UoZKElqvHZ5_gSX1XwpN3qpO',
    ['weather'] = 'https://discord.com/api/webhooks/931728146875682836/uhL8XChSeAzqOre1otuTofZhw1eTk48Owg-JyYF6WJBPigfuv1GfEbcc4LwkeS0WqlWc',
    ['moneysafes'] = 'https://discord.com/api/webhooks/931728080484040744/XYTicyfFH8f87yyfY0Xclk9NU_Et0HZLQavaKHMpW9Co7Euu9Wdmtw7okScZgXK3Zm6z',
    ['bennys'] = 'https://discord.com/api/webhooks/931728018366406726/YR6KmstbYtzaWk6WddUtHEIhWZ3PLKgpsqTiJf2k903TveOKtGqH_2YFGbyJ-zXS4ABy',
    ['bossmenu'] = 'https://discord.com/api/webhooks/931727958538879036/9YxLNY8H7BQAF8CYL5QgHnNnOK6_UAhEt02-HXzR9qobuT0R94RBUREsG_c6D0PvPRrL',
    ['robbery'] = 'https://discord.com/api/webhooks/931727888171012136/VLkrtQ2dQCiwNUyTGjKNJDHWz9uE4vvyzWiuCw3i_xtbMkH29o3NA1_XBO38boSiyGkg',
    ['casino'] = 'https://discord.com/api/webhooks/931727798488412190/MwygjgOXGvJqoKfnuQlJ7yiS7OWzQubaUBCISph8Py0MNnKvxL2GdjAaEo9Al0-4YXoE',
    ['traphouse'] = 'https://discord.com/api/webhooks/931727534633148496/sTPU3o3T_GVZjNc6HWQRvPIQaHGS7lczY9h-XT42myZQbTMIUP4z6YMh-mavY8kr6UJh',
    ['911'] = 'https://discord.com/api/webhooks/931727472297402398/jAJ_Q4diky4Q8T3VPoEn_xcANIQ0J3_3wyIIsbxIlGiYhodGjz_BV81IyXbsoEBY2662',
    ['palert'] = 'https://discord.com/api/webhooks/931727402994901082/DjEo_p395XfqF0W2RvLMOKZLOTlC7bLDNTf9KyqoD3kaCHa0tu20T7_pgaSohPuVBLEP',
    ['house'] = 'https://discord.com/api/webhooks/931727187097296936/1Wi4vk-0qY4hMNdQj7UMlBzU67iNPddeFYCvO9-MlAWYSZj53XIYC1AbNh6zSD9mqBsz',
}

local Colors = { -- https://www.spycolor.com/
    ['default'] = 14423100,
    ['blue'] = 255,
    ['red'] = 16711680,
    ['green'] = 65280,
    ['white'] = 16777215,
    ['black'] = 0,
    ['orange'] = 16744192,
    ['yellow'] = 16776960,
    ['pink'] = 16761035,
    ["lightgreen"] = 65309,
}

RegisterNetEvent('qb-log:server:CreateLog', function(name, title, color, message, tagEveryone)        
    local tag = tagEveryone or false
    local webHook = Webhooks[name] or Webhooks['default']
    local embedData = {
        {
            ['title'] = title,
            ['color'] = Colors[color] or Colors['default'],
            ['footer'] = {
                ['text'] = os.date('%c'),
            },
            ['description'] = message,
            ['author'] = {
                ['name'] = 'QBCore Logs',
                ['icon_url'] = 'https://media.discordapp.net/attachments/870094209783308299/870104331142189126/Logo_-_Display_Picture_-_Stylized_-_Red.png?width=670&height=670',
            },
        }
    }
    PerformHttpRequest(webHook, function(err, text, headers) end, 'POST', json.encode({ username = 'QB Logs', embeds = embedData}), { ['Content-Type'] = 'application/json' })
    Citizen.Wait(100)
    if tag then
        PerformHttpRequest(webHook, function(err, text, headers) end, 'POST', json.encode({ username = 'QB Logs', content = '@everyone'}), { ['Content-Type'] = 'application/json' })
    end
end)

QBCore.Commands.Add('testwebhook', 'Test Your Discord Webhook For Logs (God Only)', {}, false, function(source, args)
    TriggerEvent('qb-log:server:CreateLog', 'testwebhook', 'Test Webhook', 'default', 'Webhook setup successfully')
end, 'god')
