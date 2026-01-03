xi.help.register{
    type = "Trait",
    name = "Tactical Guard",

    description = {
        "Passive trait: Tactical Guard.",
    },

    jobs = {
        MNK = {
            { level = 60, rank = 1, value = 30 },
            { level = 65, rank = 2, value = 45 },
            { level = 75, rank = 3, value = 60 },
        },

        PUP = {
            { level = 60, rank = 1, value = 30 },
            { level = 70, rank = 2, value = 45 },
        },

    },

    notes = {
        "Values shown are total bonuses at each rank.",
        "Tuned for level 75-cap environment.",
    },

    aliases = {
        "tactical guard",
    },
}
