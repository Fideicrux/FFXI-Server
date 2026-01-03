xi.help.register{
    type = "Trait",
    name = "Magic Atk. Bonus",

    description = {
        "Passive trait: Magic Atk. Bonus.",
    },

    jobs = {
        BLM = {
            { level = 10, rank = 1, value = 20 },
            { level = 25, rank = 2, value = 24 },
            { level = 40, rank = 3, value = 28 },
            { level = 55, rank = 4, value = 32 },
            { level = 60, rank = 5, value = 36 },
            { level = 70, rank = 6, value = 40 },
        },

        RDM = {
            { level = 15, rank = 1, value = 20 },
            { level = 30, rank = 2, value = 24 },
            { level = 65, rank = 3, value = 28 },
        },

    },

    notes = {
        "Values shown are total bonuses at each rank.",
        "Tuned for level 75-cap environment.",
    },

    aliases = {
        "magic atk. bonus",
    },
}
