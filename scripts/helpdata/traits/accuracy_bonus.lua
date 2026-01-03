xi.help.register{
    type = "Trait",
    name = "Accuracy Bonus",

    description = {
        "Passive trait: Accuracy Bonus.",
    },

    jobs = {
        DNC = {
            { level = 25, rank = 1, value = 10 },
            { level = 25, rank = 1, value = 10 },
            { level = 45, rank = 2, value = 22 },
            { level = 45, rank = 2, value = 22 },
            { level = 60, rank = 3, value = 35 },
            { level = 60, rank = 3, value = 35 },
        },

        DRG = {
            { level = 25, rank = 1, value = 10 },
            { level = 25, rank = 1, value = 10 },
            { level = 45, rank = 2, value = 22 },
            { level = 45, rank = 2, value = 22 },
            { level = 60, rank = 3, value = 35 },
            { level = 60, rank = 3, value = 35 },
        },

        RNG = {
            { level = 10, rank = 1, value = 10 },
            { level = 10, rank = 1, value = 10 },
            { level = 10, rank = 1, value = 5000 },
            { level = 25, rank = 2, value = 22 },
            { level = 25, rank = 2, value = 22 },
            { level = 40, rank = 3, value = 35 },
            { level = 40, rank = 3, value = 35 },
            { level = 55, rank = 4, value = 48 },
            { level = 55, rank = 4, value = 48 },
            { level = 65, rank = 5, value = 60 },
            { level = 65, rank = 5, value = 60 },
            { level = 75, rank = 6, value = 73 },
            { level = 75, rank = 6, value = 73 },
        },

        RUN = {
            { level = 40, rank = 1, value = 10 },
            { level = 40, rank = 1, value = 10 },
            { level = 55, rank = 2, value = 22 },
            { level = 55, rank = 2, value = 22 },
            { level = 70, rank = 3, value = 35 },
            { level = 70, rank = 3, value = 35 },
        },

    },

    notes = {
        "Values shown are total bonuses at each rank.",
        "Tuned for level 75-cap environment.",
    },

    aliases = {
        "accuracy bonus",
    },
}
