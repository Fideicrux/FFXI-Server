xi.help.register{
    type = "Trait",
    name = "Crit. Atk. Bonus",

    description = {
        "Passive trait: Crit. Atk. Bonus.",
    },

    jobs = {
        DNC = {
            { level = 60, rank = 1, value = 5 },
            { level = 65, rank = 2, value = 8 },
            { level = 75, rank = 3, value = 11 },
        },

        DRK = {
            { level = 65, rank = 1, value = 5 },
            { level = 70, rank = 2, value = 8 },
        },

        THF = {
            { level = 60, rank = 1, value = 5 },
            { level = 65, rank = 2, value = 8 },
            { level = 70, rank = 3, value = 11 },
            { level = 75, rank = 4, value = 14 },
        },

        WAR = {
            { level = 60, rank = 1, value = 5 },
            { level = 65, rank = 2, value = 8 },
        },

    },

    notes = {
        "Values shown are total bonuses at each rank.",
        "Tuned for level 75-cap environment.",
    },

    aliases = {
        "crit. atk. bonus",
    },
}
