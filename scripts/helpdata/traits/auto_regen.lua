xi.help.register{
    type = "Trait",
    name = "Auto Regen",

    description = {
        "Passive trait: Auto Regen.",
    },

    jobs = {
        RUN = {
            { level = 25, rank = 1, value = 1 },
            { level = 50, rank = 2, value = 2 },
            { level = 70, rank = 3, value = 3 },
        },

        WHM = {
            { level = 20, rank = 1, value = 1 },
            { level = 60, rank = 2, value = 2 },
        },

    },

    notes = {
        "Values shown are total bonuses at each rank.",
        "Tuned for level 75-cap environment.",
    },

    aliases = {
        "auto regen",
    },
}
