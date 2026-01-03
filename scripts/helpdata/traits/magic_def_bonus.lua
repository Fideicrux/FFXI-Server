xi.help.register{
    type = "Trait",
    name = "Magic Def. Bonus",

    description = {
        "Passive trait: Magic Def. Bonus.",
    },

    jobs = {
        RDM = {
            { level = 20, rank = 1, value = 10 },
            { level = 35, rank = 2, value = 12 },
            { level = 75, rank = 3, value = 14 },
        },

        RUN = {
            { level = 10, rank = 1, value = 10 },
            { level = 25, rank = 2, value = 12 },
            { level = 40, rank = 3, value = 14 },
            { level = 55, rank = 4, value = 16 },
            { level = 60, rank = 5, value = 18 },
            { level = 70, rank = 6, value = 20 },
            { level = 75, rank = 7, value = 22 },
        },

        WHM = {
            { level = 10, rank = 1, value = 10 },
            { level = 25, rank = 2, value = 12 },
            { level = 40, rank = 3, value = 14 },
            { level = 55, rank = 4, value = 16 },
            { level = 60, rank = 5, value = 18 },
            { level = 70, rank = 6, value = 20 },
        },

    },

    notes = {
        "Values shown are total bonuses at each rank.",
        "Tuned for level 75-cap environment.",
    },

    aliases = {
        "magic def. bonus",
    },
}
