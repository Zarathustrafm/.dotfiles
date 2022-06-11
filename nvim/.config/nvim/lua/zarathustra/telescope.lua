local telescope = require('telescope')

telescope.setup {
    defaults = { 
        selection_strategy = 'closest',
        scroll_strategy = 'limit',
        dynamic_preview_title = true,

        mappings = {
            -- i for insert mode, n for normal mode
            i = {
                ["<esc>"] = require('telescope.actions').close
            }
        }
    }
}

telescope.load_extension('fzf')

