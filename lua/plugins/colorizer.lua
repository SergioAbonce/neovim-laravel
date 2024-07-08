return {
    "norcalli/nvim-colorizer.lua",
    event = "VeryLazy",
    config = function ()
        require 'colorizer'.setup ({
          'html';
          'css';
          'javascript';
          'php';
          'phponly';
          'blade';
          'lua';
        },{ mode = 'foreground' })
    end
}
