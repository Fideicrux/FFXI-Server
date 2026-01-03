xi.help.register{
    type = "Trait",
    name = "Smite",

    description = {
        "Passive trait: Smite.",
    },

    jobs = {
        DRG = {
            { level = 30, rank = 1, value = 25 },
            { level = 60, rank = 2, value = 38 },
        },

        DRK = {
            { level = 10, rank = 1, value = 25 },
            { level = 25, rank = 2, value = 38 },
            { level = 40, rank = 3, value = 51 },
            { level = 55, rank = 4, value = 64 },
            { level = 70, rank = 5, value = 76 },
        },

        MNK = {
            { level = 30, rank = 1, value = 25 },
            { level = 60, rank = 2, value = 38 },
        },

        PUP = {
            { level = 45, rank = 1, value = 25 },
        },

        WAR = {
            { level = 25, rank = 1, value = 25 },
            { level = 50, rank = 2, value = 38 },
            { level = 70, rank = 3, value = 51 },
        },

    },

    notes = {
        "Values shown are total bonuses at each rank.",
        "Tuned for level 75-cap environment.",
    },

    aliases = {
        "smite",
    },
}
