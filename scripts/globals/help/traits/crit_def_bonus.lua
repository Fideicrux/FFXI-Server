xi.help.register{
    type = "Trait",
    name = "Crit. Def. Bonus",

    description = {
        "Passive trait: Crit. Def. Bonus.",
    },

    jobs = {
        BRD = {
            { level = 60, rank = 1, value = 5 },
            { level = 70, rank = 2, value = 8 },
        },

        DRG = {
            { level = 65, rank = 1, value = 5 },
            { level = 70, rank = 2, value = 8 },
        },

        PLD = {
            { level = 60, rank = 1, value = 5 },
            { level = 65, rank = 2, value = 8 },
            { level = 70, rank = 3, value = 11 },
            { level = 75, rank = 4, value = 14 },
        },

        PUP = {
            { level = 65, rank = 1, value = 5 },
            { level = 70, rank = 2, value = 8 },
        },

    },

    notes = {
        "Values shown are total bonuses at each rank.",
        "Tuned for level 75-cap environment.",
    },

    aliases = {
        "crit. def. bonus",
    },
}
