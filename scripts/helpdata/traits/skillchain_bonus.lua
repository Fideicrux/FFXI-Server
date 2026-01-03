xi.help.register{
    type = "Trait",
    name = "Skillchain Bonus",

    description = {
        "Passive trait: Skillchain Bonus.",
    },

    jobs = {
        DNC = {
            { level = 35, rank = 1, value = 8 },
            { level = 45, rank = 2, value = 12 },
            { level = 55, rank = 3, value = 16 },
            { level = 65, rank = 4, value = 20 },
            { level = 75, rank = 4, value = 23 },
        },

        MNK = {
            { level = 65, rank = 1, value = 8 },
            { level = 70, rank = 2, value = 12 },
        },

        NIN = {
            { level = 65, rank = 1, value = 8 },
            { level = 70, rank = 2, value = 12 },
        },

        SAM = {
            { level = 60, rank = 1, value = 8 },
            { level = 65, rank = 2, value = 12 },
            { level = 75, rank = 3, value = 16 },
        },

    },

    notes = {
        "Values shown are total bonuses at each rank.",
        "Tuned for level 75-cap environment.",
    },

    aliases = {
        "skillchain bonus",
    },
}
