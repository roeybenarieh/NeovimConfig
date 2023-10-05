require("neogen").setup({
    enabled = true,
    insert_after_comment = true,
    -- doesnt work, suppose to cycle threw all of the unfilled annotations
    jump_map = "<C-x>",
    languages = {
        python = {
            template = {
            annotation_convention = "reST",
            },
        },
    },
})