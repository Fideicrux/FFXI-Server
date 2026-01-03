-----------------------------------
-- Warrior Abilities
-----------------------------------

xi.help.register{
    type = "Ability",
    name = "Mighty Strikes",

    jobs = { WAR = 1 },

    details =
    {
        "Physical attacks always critical hit.",
        "Duration: 45 seconds",
        "Recast: 1800 seconds",
    },

    notes =
    {
        "Server-modified.",
        "Does not apply critical bonus to weapon skills.",
    },

    aliases = { "mightystrikes" },
}

xi.help.register{
    type = "Ability",
    name = "Provoke",

    jobs = { WAR = 5 },

    details =
    {
        "Generates volatile enmity on the target.",
        "Duration: Instant",
        "Recast: 30 seconds",
    },
}

xi.help.register{
    type = "Ability",
    name = "Berserk",

    jobs = { WAR = 15 },

    details =
    {
        "Increases attack while reducing defense.",
        "Duration: 180 seconds",
        "Recast: 300 seconds",
    },
}

xi.help.register{
    type = "Ability",
    name = "Defender",

    jobs = { WAR = 25 },

    details =
    {
        "Increases defense while reducing attack.",
        "Duration: 180 seconds",
        "Recast: 300 seconds",
    },
}

xi.help.register{
    type = "Ability",
    name = "Warcry",

    jobs = { WAR = 35 },

    details =
    {
        "Increases attack for party members.",
        "Duration: 60 seconds",
        "Recast: 300 seconds",
    },
}

xi.help.register{
    type = "Ability",
    name = "Aggressor",

    jobs = { WAR = 45 },

    details =
    {
        "Increases accuracy while reducing evasion.",
        "Duration: 180 seconds",
        "Recast: 300 seconds",
    },
}

xi.help.register{
    type = "Ability",
    name = "Retaliation",

    jobs = { WAR = 60 },

    details =
    {
        "Allows counterattacks when struck.",
        "Duration: 180 seconds",
        "Recast: 300 seconds",
    },
}

xi.help.register{
    type = "Ability",
    name = "Tomahawk",

    jobs = { WAR = 75 },

    details =
    {
        "Reduces target's resistance to physical damage.",
        "Duration: 60 seconds",
        "Recast: 180 seconds",
    },
}

xi.help.register{
    type = "Ability",
    name = "Warrior's Charge",

    jobs = { WAR = 75 },

    details =
    {
        "Enhances next weapon skill.",
        "Duration: One WS",
        "Recast: 900 seconds",
    },

    aliases = { "warriorscharge" },
}

xi.help.register{
    type = "Ability",
    name = "Restraint",

    jobs = { WAR = 77 },

    details =
    {
        "Enhances weapon skill damage under certain conditions.",
        "Duration: 300 seconds",
        "Recast: 300 seconds",
    },
}

xi.help.register{
    type = "Ability",
    name = "Blood Rage",

    jobs = { WAR = 87 },

    details =
    {
        "Increases critical hit rate for party members.",
        "Duration: 60 seconds",
        "Recast: 900 seconds",
    },

    aliases = { "bloodrage" },
}

xi.help.register{
    type = "Ability",
    name = "Brazen Rush",

    jobs = { WAR = 96 },

    details =
    {
        "Reduces weapon skill recast delay.",
        "Duration: 60 seconds",
        "Recast: 1800 seconds",
    },

    aliases = { "brazenrush" },
}
