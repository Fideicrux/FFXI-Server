xi.help.register{
    type = "Trait",
    name = "Conserve Mp",

    description = {
        "Passive trait: Conserve Mp.",
    },

    jobs = {
        BLM = {
            { level = 15, rank = 1, value = 25 },
            { level = 60, rank = 2, value = 28 },
            { level = 65, rank = 3, value = 31 },
        },

        GEO = {
            { level = 10, rank = 1, value = 25 },
            { level = 20, rank = 2, value = 28 },
            { level = 30, rank = 3, value = 31 },
            { level = 40, rank = 4, value = 34 },
            { level = 55, rank = 5, value = 37 },
            { level = 65, rank = 6, value = 40 },
            { level = 75, rank = 7, value = 43 },
        },

        SCH = {
            { level = 20, rank = 1, value = 25 },
        },

    },

    notes = {
        "Values shown are total bonuses at each rank.",
        "Tuned for level 75-cap environment.",
    },

    aliases = {
        "conserve mp",
    },
}
