xi.help.register{
    type = "Trait",
    name = "Resist Slow",

    description = {
        "Passive trait: Resist Slow.",
    },

    jobs = {
        BST = {
            { level = 10, rank = 1, value = 10 },
            { level = 25, rank = 2, value = 15 },
            { level = 40, rank = 3, value = 20 },
            { level = 55, rank = 4, value = 25 },
            { level = 60, rank = 5, value = 30 },
        },

        DNC = {
            { level = 15, rank = 1, value = 10 },
            { level = 40, rank = 2, value = 15 },
            { level = 60, rank = 3, value = 20 },
        },

        PUP = {
            { level = 10, rank = 1, value = 10 },
            { level = 40, rank = 2, value = 15 },
            { level = 55, rank = 3, value = 20 },
            { level = 60, rank = 4, value = 25 },
        },

        SMN = {
            { level = 15, rank = 1, value = 10 },
            { level = 30, rank = 2, value = 15 },
            { level = 45, rank = 3, value = 20 },
            { level = 60, rank = 4, value = 25 },
        },

    },

    notes = {
        "Values shown are total bonuses at each rank.",
        "Tuned for level 75-cap environment.",
    },

    aliases = {
        "resist slow",
    },
}
