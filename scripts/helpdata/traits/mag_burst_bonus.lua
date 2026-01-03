xi.help.register{
    type = "Trait",
    name = "Mag. Burst Bonus",

    description = {
        "Passive trait: Mag. Burst Bonus.",
    },

    jobs = {
        BLM = {
            { level = 35, rank = 1, value = 5 },
            { level = 45, rank = 2, value = 7 },
            { level = 55, rank = 3, value = 9 },
            { level = 65, rank = 4, value = 11 },
            { level = 75, rank = 5, value = 13 },
        },

        NIN = {
            { level = 60, rank = 1, value = 5 },
            { level = 70, rank = 2, value = 7 },
        },

        RDM = {
            { level = 65, rank = 1, value = 5 },
            { level = 70, rank = 2, value = 7 },
        },

        SCH = {
            { level = 60, rank = 1, value = 5 },
            { level = 65, rank = 2, value = 7 },
            { level = 75, rank = 3, value = 9 },
        },

    },

    notes = {
        "Values shown are total bonuses at each rank.",
        "Tuned for level 75-cap environment.",
    },

    aliases = {
        "mag. burst bonus",
    },
}
