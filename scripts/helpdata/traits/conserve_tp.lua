xi.help.register{
    type = "Trait",
    name = "Conserve Tp",

    description = {
        "Passive trait: Conserve Tp.",
    },

    jobs = {
        DNC = {
            { level = 60, rank = 1, value = 15 },
            { level = 65, rank = 2, value = 18 },
            { level = 75, rank = 3, value = 21 },
        },

        DRG = {
            { level = 35, rank = 1, value = 15 },
            { level = 45, rank = 2, value = 18 },
            { level = 55, rank = 3, value = 21 },
            { level = 65, rank = 4, value = 24 },
            { level = 75, rank = 5, value = 26 },
        },

        RNG = {
            { level = 60, rank = 1, value = 15 },
            { level = 70, rank = 2, value = 18 },
        },

    },

    notes = {
        "Values shown are total bonuses at each rank.",
        "Tuned for level 75-cap environment.",
    },

    aliases = {
        "conserve tp",
    },
}
