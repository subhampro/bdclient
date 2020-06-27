Config = {}
Translation = {}

Config.Shopkeeper = 416176080 -- hash of the shopkeeper ped
Config.Locale = 'en' -- 'en', 'sv' or 'custom'

Config.Shops = {

    -- {coords = vector3(x, y, z), heading = peds heading, money = {min, max}, cops = amount of cops required to rob, blip = true: add blip on map false: don't add blip, name = name of the store (when cops get alarm, blip name etc)}
    {coords = vector3(24.03, -1345.63, 29.5-0.98), heading = 266.0, money = {100, 4000}, cops = 2, blip = true, name = 'Store Robbery', cooldown = {hour = 0, minute = 20, second = 0}, robbed = false},
    {coords = vector3(-3038.38, 584.75, 7.91-0.98), heading = 17.24, money = {100, 4000}, cops = 2, blip = true, name = 'Store Robbery', cooldown = {hour = 0, minute = 20, second = 0}, robbed = false},
    {coords = vector3(-1221.52,-907.99, 12.33-0.98), heading = 32.81, money = {100, 4000}, cops = 2, blip = true, name = 'Store Robbery', cooldown = {hour = 0, minute = 20, second = 0}, robbed = false},
    {coords = vector3(1164.91, -325.16, 69.21-0.98), heading = 97.31, money = {100, 4000}, cops = 2, blip = true, name = 'Store Robbery', cooldown = {hour = 0, minute = 20, second = 0}, robbed = false},
    {coords = vector3(1727.62, 6414.73, 35.04-0.98), heading = 243.2, money = {100, 4000}, cops = 2, blip = true, name = 'Store Robbery', cooldown = {hour = 0, minute = 20, second = 0}, robbed = false},
    {coords = vector3(372.44, 325.91, 103.57-0.98), heading = 256.38, money = {100, 4000}, cops = 2, blip = true, name = 'Store Robbery', cooldown = {hour = 0, minute = 20, second = 0}, robbed = false},
    
}



Translation = {
    ['en'] = {
        ['shopkeeper'] = 'shopkeeper',
        ['robbed'] = "I was just robbed and ~r~don't ~w~have any money left!",
        ['cashrecieved'] = 'You got:',
        ['currency'] = '$',
        ['scared'] = 'Scared:',
        ['no_cops'] = 'There are ~r~not~w~ enough cops online!',
        ['cop_msg'] = 'We have sent a photo of the robber taken by the CCTV camera!',
        ['set_waypoint'] = 'Set waypoint to the store',
        ['hide_box'] = 'Close this box',
        ['robbery'] = 'Robbery in progress',
        ['walked_too_far'] = 'You walked too far away!'
    },
    ['sv'] = {
        ['shopkeeper'] = 'butiksbiträde',
        ['robbed'] = 'Jag blev precis rånad och har inga pengar kvar!',
        ['cashrecieved'] = 'Du fick:',
        ['currency'] = 'SEK',
        ['scared'] = 'Rädd:',
        ['no_cops'] = 'Det är inte tillräckligt med poliser online!',
        ['cop_msg'] = 'Vi har skickat en bild på rånaren från övervakningskamerorna!',
        ['set_waypoint'] = 'Sätt GPS punkt på butiken',
        ['hide_box'] = 'Stäng denna rutan',
        ['robbery'] = 'Pågående butiksrån',
        ['walked_too_far'] = 'Du gick för långt bort!'
    },
    ['custom'] = { -- edit this to your language
        ['shopkeeper'] = '',
        ['robbed'] = '',
        ['cashrecieved'] = '',
        ['currency'] = '',
        ['scared'] = '',
        ['no_cops'] = '',
        ['cop_msg'] = '',
        ['set_waypoint'] = '',
        ['hide_box'] = '',
        ['robbery'] = '',
        ['walked_too_far'] = ''
    }
}