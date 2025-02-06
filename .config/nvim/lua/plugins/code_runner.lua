return {
  "CRAG666/code_runner.nvim",
  config = true,
  keys = {
    {
      "<leader>v",
      function()
        require("code_runner").run_code()
      end,
      desc = "[E]xecute code",
    },
  },
  opts = {
    filetype = {
      javascript = "node",
      typescript = "bun",
      html = "open $fileName",
      cpp = {
        "cd $dir &&",
        "g++ --std=c++11 $fileName",
        "-o /tmp/$fileNameWithoutExt &&",
        "/tmp/$fileNameWithoutExt",
      },
      go = "go run",
      python = "python3",
      c = {
        "cd $dir &&",
        "gcc $fileName -o",
        "/tmp/$fileNameWithoutExt &&",
        "/tmp/$fileNameWithoutExt &&",
        "rm /tmp/$fileNameWithoutExt",
      },
    },
  },
}
