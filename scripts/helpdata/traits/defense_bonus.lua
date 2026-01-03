xi.help.register{
    type = "Trait",
    name = "Defense Bonus",

    description = {
        "Passive trait: Defense Bonus.",
    },

    jobs = {
        PLD = {
            { level = 10, rank = 1, value = 10 },
            { level = 25, rank = 2, value = 22 },
            { level = 40, rank = 3, value = 35 },
            { level = 55, rank = 4, value = 48 },
            { level = 60, rank = 5, value = 60 },
            { level = 70, rank = 6, value = 72 },
        },

        WAR = {
            { level = 10, rank = 1, value = 10 },
            { level = 35, rank = 2, value = 22 },
            { level = 65, rank = 3, value = 35 },
        },

    },

    notes = {
        "Values shown are total bonuses at each rank.",
        "Tuned for level 75-cap environment.",
    },

    aliases = {
        "defense bonus",
    },
}
