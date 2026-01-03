xi.help.register{
    type = "Trait",
    name = "Dual Wield",

    description = {
        "Passive trait: Dual Wield.",
    },

    jobs = {
        DNC = {
            { level = 15, rank = 1, value = 10 },
            { level = 30, rank = 2, value = 15 },
            { level = 45, rank = 3, value = 25 },
            { level = 60, rank = 4, value = 30 },
        },

        NIN = {
            { level = 10, rank = 1, value = 10 },
            { level = 20, rank = 2, value = 15 },
            { level = 35, rank = 3, value = 25 },
            { level = 50, rank = 4, value = 30 },
            { level = 65, rank = 5, value = 35 },
        },

        THF = {
            { level = 65, rank = 1, value = 10 },
            { level = 70, rank = 2, value = 15 },
            { level = 75, rank = 3, value = 25 },
        },

    },

    notes = {
        "Values shown are total bonuses at each rank.",
        "Tuned for level 75-cap environment.",
    },

    aliases = {
        "dual wield",
    },
}
