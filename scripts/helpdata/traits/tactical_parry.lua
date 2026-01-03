xi.help.register{
    type = "Trait",
    name = "Tactical Parry",

    description = {
        "Passive trait: Tactical Parry.",
    },

    jobs = {
        DNC = {
            { level = 60, rank = 1, value = 20 },
            { level = 65, rank = 2, value = 30 },
            { level = 70, rank = 3, value = 40 },
            { level = 75, rank = 4, value = 50 },
        },

        DRK = {
            { level = 65, rank = 1, value = 20 },
            { level = 75, rank = 2, value = 30 },
        },

        NIN = {
            { level = 60, rank = 1, value = 20 },
            { level = 65, rank = 2, value = 30 },
            { level = 75, rank = 3, value = 40 },
        },

        RUN = {
            { level = 30, rank = 1, value = 20 },
            { level = 45, rank = 2, value = 30 },
            { level = 65, rank = 3, value = 40 },
        },

    },

    notes = {
        "Values shown are total bonuses at each rank.",
        "Tuned for level 75-cap environment.",
    },

    aliases = {
        "tactical parry",
    },
}
