xi.help.register{
    type = "Trait",
    name = "Resist Paralyze",

    description = {
        "Passive trait: Resist Paralyze.",
    },

    jobs = {
        COR = {
            { level = 5, rank = 1, value = 10 },
            { level = 20, rank = 2, value = 15 },
            { level = 35, rank = 3, value = 20 },
            { level = 50, rank = 4, value = 25 },
            { level = 60, rank = 5, value = 30 },
        },

        DRK = {
            { level = 15, rank = 1, value = 10 },
            { level = 30, rank = 2, value = 15 },
            { level = 45, rank = 3, value = 20 },
            { level = 55, rank = 4, value = 25 },
            { level = 60, rank = 5, value = 30 },
        },

    },

    notes = {
        "Values shown are total bonuses at each rank.",
        "Tuned for level 75-cap environment.",
    },

    aliases = {
        "resist paralyze",
    },
}
