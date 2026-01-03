xi.help.register{
    type = "Trait",
    name = "Fencer",

    description = {
        "Passive trait: Fencer.",
    },

    jobs = {
        BRD = {
            { level = 65, rank = 1, value = 200 },
            { level = 65, rank = 1, value = 3 },
            { level = 70, rank = 2, value = 300 },
            { level = 70, rank = 2, value = 5 },
        },

        BST = {
            { level = 60, rank = 1, value = 200 },
            { level = 60, rank = 1, value = 3 },
            { level = 65, rank = 2, value = 300 },
            { level = 65, rank = 2, value = 5 },
            { level = 70, rank = 3, value = 400 },
            { level = 70, rank = 3, value = 7 },
        },

        WAR = {
            { level = 35, rank = 1, value = 200 },
            { level = 35, rank = 1, value = 3 },
            { level = 45, rank = 2, value = 300 },
            { level = 45, rank = 2, value = 5 },
            { level = 55, rank = 3, value = 400 },
            { level = 55, rank = 3, value = 7 },
            { level = 65, rank = 4, value = 450 },
            { level = 65, rank = 4, value = 9 },
            { level = 75, rank = 5, value = 500 },
            { level = 75, rank = 5, value = 10 },
        },

    },

    notes = {
        "Values shown are total bonuses at each rank.",
        "Tuned for level 75-cap environment.",
    },

    aliases = {
        "fencer",
    },
}
