xi.help.register{
    type = "Trait",
    name = "Attack Bonus",

    description = {
        "Passive trait: Attack Bonus.",
    },

    jobs = {
        DRG = {
            { level = 10, rank = 1, value = 10 },
            { level = 10, rank = 1, value = 10 },
            { level = 70, rank = 2, value = 22 },
            { level = 70, rank = 2, value = 22 },
        },

        DRK = {
            { level = 10, rank = 1, value = 10 },
            { level = 10, rank = 1, value = 10 },
            { level = 25, rank = 2, value = 22 },
            { level = 25, rank = 2, value = 22 },
            { level = 40, rank = 3, value = 35 },
            { level = 40, rank = 3, value = 35 },
            { level = 55, rank = 4, value = 48 },
            { level = 55, rank = 4, value = 48 },
            { level = 60, rank = 5, value = 60 },
            { level = 60, rank = 5, value = 60 },
            { level = 65, rank = 6, value = 72 },
            { level = 65, rank = 6, value = 72 },
            { level = 70, rank = 7, value = 84 },
            { level = 70, rank = 7, value = 84 },
            { level = 75, rank = 8, value = 96 },
            { level = 75, rank = 8, value = 96 },
        },

        WAR = {
            { level = 25, rank = 1, value = 10 },
            { level = 25, rank = 1, value = 10 },
            { level = 50, rank = 2, value = 22 },
            { level = 50, rank = 2, value = 22 },
            { level = 70, rank = 3, value = 35 },
            { level = 70, rank = 3, value = 35 },
        },

    },

    notes = {
        "Values shown are total bonuses at each rank.",
        "Tuned for level 75-cap environment.",
    },

    aliases = {
        "attack bonus",
    },
}
