xi.help.register{
    type = "Trait",
    name = "Elemental Celerity",

    description = {
        "Passive trait: Elemental Celerity.",
    },

    jobs = {
        BLM = {
            { level = 40, rank = 1, value = 10 },
            { level = 45, rank = 2, value = 15 },
            { level = 55, rank = 3, value = 20 },
            { level = 60, rank = 4, value = 25 },
            { level = 70, rank = 5, value = 30 },
        },

        GEO = {
            { level = 40, rank = 1, value = 10 },
            { level = 55, rank = 2, value = 15 },
            { level = 70, rank = 3, value = 20 },
        },

    },

    notes = {
        "Values shown are total bonuses at each rank.",
        "Tuned for level 75-cap environment.",
    },

    aliases = {
        "elemental celerity",
    },
}
