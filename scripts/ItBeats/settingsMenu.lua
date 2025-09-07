local I = require('openmw.interfaces')

I.Settings.registerPage {
    key = 'ItBeats',
    l10n = 'ItBeats_Settings',
    name = 'page_name',
    description = 'page_description',
}

I.Settings.registerGroup {
    key = 'SettingsItBeats_heartbeat',
    page = 'ItBeats',
    l10n = 'ItBeats_Settings',
    name = 'heartbeat_groupName',
    order = 1,
    permanentStorage = true,
    settings = {
        {
            key = 'tempo',
            name = 'tempo_name',
            description = 'tempo_description',
            renderer = 'number',
            integer = false,
            default = 3,
            min = .01,
        },
        {
            key = 'maxOffset',
            name = 'maxOffset_name',
            description = 'maxOffset_description',
            renderer = 'number',
            integer = false,
            default = .5,
            min = 0,
        },
    }
}

I.Settings.registerGroup {
    key = 'SettingsItBeats_volume',
    page = 'ItBeats',
    l10n = 'ItBeats_Settings',
    name = 'volume_groupName',
    order = 2,
    permanentStorage = true,
    settings = {
        {
            key = 'masterVolume',
            name = 'masterVolume_name',
            description = 'masterVolume_description',
            renderer = 'number',
            integer = false,
            default = 100,
            min = 0,
        },
        {
            key = 'exteriorVolume',
            name = 'exteriorVolume_name',
            renderer = 'number',
            integer = false,
            default = 75,
            min = 0,
        },
        {
            key = 'genericInteriorVolume',
            name = 'genericInteriorVolume_name',
            description = 'genericInteriorVolume_description',
            renderer = 'number',
            integer = false,
            default = 75,
            min = 0,
        },
        {
            key = 'dagothUrVolume',
            name = 'dagothUrVolume_name',
            renderer = 'number',
            integer = false,
            default = 100,
            min = 0,
        },
        {
            key = 'facilityCavernVolume',
            name = 'facilityCavernVolume_name',
            description = 'facilityCavernVolume_description',
            renderer = 'number',
            integer = false,
            default = 125,
            min = 0,
        },
        {
            key = 'akulakhansChamberVolume',
            name = 'akulakhansChamberVolume_name',
            renderer = 'number',
            integer = false,
            default = 150,
            min = 0,
        },
    }
}

I.Settings.registerGroup {
    key = 'SettingsItBeats_debug',
    page = 'ItBeats',
    l10n = 'ItBeats_Settings',
    name = 'debug_groupName',
    order = 100,
    permanentStorage = true,
    settings = {
        {
            key = 'enableMod',
            name = 'enableMod_name',
            renderer = 'checkbox',
            default = true,
        },
        {
            key = 'ignoreRegionRequirement',
            name = 'ignoreRegionRequirement_name',
            renderer = 'checkbox',
            default = false,
        },
        {
            key = 'ignoreQuestRequirement',
            name = 'ignoreQuestRequirement_name',
            renderer = 'checkbox',
            default = false,
        },
    }
}