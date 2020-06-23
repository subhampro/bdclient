Config = {
    ImpoundPrice = 50, -- price to retrieve impounded car
    Entrances = {
        {coords = vector3(83.8, 95.68, 77.66), heading = 70.25},
        {coords = vector3(-742.92, -2473.92, 13.45), heading = 332.11},
    },
    View = {
        vehicle = {coords = vector3(228.8, -986.97, -99.96), heading = 179.12},
    },
    Impounds = {
        {
            vehicleSpawn = {coords = vector3(409.2760, -1623.038, 28.83), heading = 285.99},
            menu = vector3(409.2760, -1623.038, 29.2919),
        },
        
        {
            vehicleSpawn = {coords = vector3(1705.8185, 3596.5849, 35.4259), heading = 221.0774},
            menu = vector3(1697.5575, 3595.8335, 35.5643),
        },
        
        {
            vehicleSpawn = {coords = vector3(-243.8378, 6194.4185, 31.4892), heading = 225.9618},
            menu = vector3(-237.2449, 6201.4565, 31.9392),
        },
    },
}

Strings = {
    ['enter_garage'] = 'Press %s to enter the garage',
    ['store_garage'] = 'Press %s to store your %s',
    ['not_your'] = 'Garage - you do not own this vehicle!',
    ['no_vehicle'] = 'Garage - no vehicle found',
    ['impound'] = ' Impounded',
    ['take_out'] = 'Take out %s?',
    ['yes'] = 'Yes',
    ['no'] = 'No',
    ['retrieve_impounded'] = 'Retrieve %s | %s for %s',
    ['open_impound'] = 'Press ~INPUT_CONTEXT~ to open the impound',
    ['no_money'] = "You don't have enough money!",
    ['impound_blip'] = 'Impound',
    ['garage'] = 'Garage'
}