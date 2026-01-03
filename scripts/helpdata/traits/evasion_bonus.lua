xi.help.register{
    type = "Trait",
    name = "Evasion Bonus",

    description = {
        "Passive trait: Evasion Bonus.",
    },

    jobs = {
        DNC = {
            { level = 10, rank = 1, value = 10 },
            { level = 35, rank = 2, value = 22 },
            { level = 55, rank = 3, value = 35 },
            { level = 65, rank = 4, value = 48 },
        },

        PUP = {
            { level = 15, rank = 1, value = 10 },
            { level = 30, rank = 2, value = 22 },
            { level = 45, rank = 3, value = 35 },
            { level = 60, rank = 4, value = 48 },
        },

        THF = {
            { level = 10, rank = 1, value = 10 },
            { level = 25, rank = 2, value = 22 },
            { level = 40, rank = 3, value = 35 },
            { level = 55, rank = 4, value = 48 },
            { level = 60, rank = 5, value = 60 },
            { level = 65, rank = 6, value = 72 },
        },

    },

    notes = {
        "Values shown are total bonuses at each rank.",
        "Tuned for level 75-cap environment.",
    },

    aliases = {
        "evasion bonus",
    },
}
