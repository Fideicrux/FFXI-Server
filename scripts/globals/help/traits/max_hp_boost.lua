xi.help.register{
    type = "Trait",
    name = "Max Hp Boost",

    description = {
        "Passive trait: Max Hp Boost.",
    },

    jobs = {
        MNK = {
            { level = 10, rank = 1, value = 30 },
            { level = 20, rank = 2, value = 60 },
            { level = 25, rank = 3, value = 120 },
            { level = 35, rank = 4, value = 180 },
            { level = 40, rank = 5, value = 240 },
            { level = 50, rank = 6, value = 280 },
        },

        NIN = {
            { level = 15, rank = 1, value = 30 },
            { level = 30, rank = 2, value = 60 },
            { level = 45, rank = 3, value = 120 },
            { level = 60, rank = 4, value = 180 },
            { level = 75, rank = 5, value = 240 },
        },

        PLD = {
            { level = 35, rank = 1, value = 30 },
            { level = 65, rank = 2, value = 60 },
        },

        RUN = {
            { level = 15, rank = 1, value = 30 },
            { level = 30, rank = 2, value = 60 },
            { level = 45, rank = 3, value = 120 },
            { level = 60, rank = 4, value = 180 },
            { level = 75, rank = 5, value = 240 },
        },

        WAR = {
            { level = 25, rank = 1, value = 30 },
            { level = 40, rank = 2, value = 60 },
            { level = 55, rank = 3, value = 120 },
            { level = 70, rank = 4, value = 180 },
        },

    },

    notes = {
        "Values shown are total bonuses at each rank.",
        "Tuned for level 75-cap environment.",
    },

    aliases = {
        "max hp boost",
    },
}
