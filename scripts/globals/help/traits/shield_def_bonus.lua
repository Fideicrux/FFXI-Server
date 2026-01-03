xi.help.register{
    type = "Trait",
    name = "Shield Def. Bonus",

    description = {
        "Passive trait: Shield Def. Bonus.",
    },

    jobs = {
        PLD = {
            { level = 60, rank = 1, value = 2 },
            { level = 60, rank = 2, value = 4 },
            { level = 65, rank = 3, value = 6 },
            { level = 70, rank = 4, value = 8 },
        },

        WAR = {
            { level = 60, rank = 1, value = 2 },
            { level = 65, rank = 2, value = 4 },
            { level = 75, rank = 3, value = 6 },
        },

        WHM = {
            { level = 65, rank = 1, value = 2 },
            { level = 70, rank = 2, value = 4 },
        },

    },

    notes = {
        "Values shown are total bonuses at each rank.",
        "Tuned for level 75-cap environment.",
    },

    aliases = {
        "shield def. bonus",
    },
}
