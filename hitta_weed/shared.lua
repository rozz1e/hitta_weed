Config = {}

Config.Harvest = {
    blip = {
        enabled = true, -- enable/disable blip
        coords = vec3(2223.83, 5576.49, 53.80), -- location of the blip
        sprite = 469, -- docs.fivem.net/docs/game-references/blips/
        color = 52, -- docs.fivem.net/docs/game-references/blips/#blip-colors
        name = "Weed Picking", -- blip name
        scale = 1.0, -- how big will the blip be.
    },

    plant = 'prop_weed_01', -- plant to harvest
    duration = 10000, -- duration to harvest weed in miliseconds
    label = '[E] - Pick Weed', -- string of text ui

    item = 'weed_leafs', -- item to give when harvested
    itemCount = math.random(1, 3), -- how many items to give when harvested?
}

Config.Process = {
    blip = {
        enabled = true, -- enable/disable blip
        coords = vec3(990.28, -1852.81, 31.03), -- location of the blip
        sprite = 499, -- docs.fivem.net/docs/game-references/blips/
        color = 52, -- docs.fivem.net/docs/game-references/blips/#blip-colors
        name = "Weed Lab", -- blip name
        scale = 1.0, -- how big will the blip be.
    },

    lab = {
        enabled = true, -- enable/disable laboratory
        entrance = vec3(990.24, -1852.76, 31.03), -- enter laboratory
        entranceHeading = 177.90, -- where the player should be heading when he leaves lab
        exit = vec3(1066.37, -3183.42, -39.16) -- exit laboratory
    },

    marker = {
        enabled = true,
        type = 21,
        coords = vec3(1038.37, -3205.93, -38.0),
        scale = vector3(0.3, 0.3, 0.3),
        colour = {r = 15, g = 133, b = 42, a = 255},
    },

    coords = vec3(1038.37, -3205.93, -37.28), -- processing coords
    duration = 10000, -- duration to process weed in miliseconds
    itemNeeded = 'scissors', -- item needed to start processing
    harvestNeededCount = 3, -- how many harvested items u need to start processing?
    item = 'weed_buds', -- item to give when processed
    itemCount = math.random(2, 4), -- how many items to give when processesed?

}

Strings = {
    success = 'Success',
    successful_pick_desc = 'You have successfully picked weed',
    unsuccessful = 'Unsuccessful',
    unsuccessful_pick_desc = 'This plant has already been harvested',
    cancelled = 'Cancelled',
    cancelled_desc = 'You have cancelled your last pick',
    picking_progress = 'Picking weed...',
    enter_lab = '[E] - Enter Lab',
    laboratory = 'Laboratory',
    successful_entered_lab_desc = 'You have successfully entered the laboratory',
    successful_exit_lab_desc = 'You have successfully left the laboratory',
    exit_lab = '[E] - Exit Lab',
    process_weed = '[E] - Process Weed',
    process = 'Weed Processing',
    unsuccessful_process_noitems_desc = 'You dont have what you need',
    processing_progress = 'Processing Weed...',
    successful_progress_desc = 'You have successfully processed your weed',
    cancelled_progress_desc = 'You have cancelled the process',
    unsuccessful_processed_desc = 'You dont have enough materials'
}
