xi.help.register{
    type = "Trait",
    name = "Max Mp Boost",

    description = {
        "Passive trait: Max Mp Boost.",
    },

    jobs = {
        GEO = {
            { level = 25, rank = 1, value = 10 },
            { level = 45, rank = 2, value = 20 },
            { level = 70, rank = 3, value = 40 },
        },

        SCH = {
            { level = 25, rank = 1, value = 10 },
            { level = 65, rank = 2, value = 20 },
        },

        SMN = {
            { level = 10, rank = 1, value = 10 },
            { level = 25, rank = 2, value = 20 },
            { level = 40, rank = 3, value = 40 },
            { level = 55, rank = 4, value = 60 },
            { level = 60, rank = 5, value = 80 },
            { level = 75, rank = 6, value = 100 },
        },

    },

    notes = {
        "Values shown are total bonuses at each rank.",
        "Tuned for level 75-cap environment.",
    },

    aliases = {
        "max mp boost",
    },
}
