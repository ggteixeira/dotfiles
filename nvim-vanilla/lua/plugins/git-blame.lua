local g = vim.g

g.gitblame_enabled = 0
g.gitblame_message_template = '<author>, <date> • <sha> | <summary>'
g.gitblame_date_format = '%r'
g.gitblame_ignored_filetypes = {
  'NvimTree',
  'packer',
  'TelescopePrompt',
  'NeogitStatus',
  'NeogitPopup',
  'Trouble',
  'gitcommit',
  'octo',
}


