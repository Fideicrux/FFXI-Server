xi.help.register{
    type = "Trait",
    name = "Martial Arts",

    description = {
        "Passive trait: Martial Arts.",
    },

    jobs = {
        MNK = {
            { level = 1, rank = 1, value = 80 },
            { level = 10, rank = 2, value = 100 },
            { level = 25, rank = 3, value = 120 },
            { level = 35, rank = 4, value = 140 },
            { level = 45, rank = 5, value = 160 },
            { level = 55, rank = 6, value = 180 },
            { level = 60, rank = 7, value = 200 },
        },

        PUP = {
            { level = 20, rank = 1, value = 80 },
            { level = 40, rank = 2, value = 100 },
            { level = 55, rank = 3, value = 120 },
            { level = 65, rank = 4, value = 140 },
            { level = 75, rank = 5, value = 160 },
        },

    },

    notes = {
        "Values shown are total bonuses at each rank.",
        "Tuned for level 75-cap environment.",
    },

    aliases = {
        "martial arts",
    },
}
