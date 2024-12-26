return {
  "j-hui/fidget.nvim",
  tag = "v1.0.0",
  opts = {
    progress = {
      ignore_done_already = true,
      ignore_empty_message = true,
      display = {
        progress_icon = {
          pattern = "moon",
          period = 1,
        },
      },
    },
    notification = {
      view = {
        stack_upwards = true,
      },
    },
  },
}
