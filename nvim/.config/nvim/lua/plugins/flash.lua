return {
  "folke/flash.nvim",
  keys = {
    -- disable the default flash keymap
    { "s", mode = { "n", "x", "o" }, false },
    {
      "<Enter>",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump()
      end,
      desc = "Flash",
    },
  },
}
