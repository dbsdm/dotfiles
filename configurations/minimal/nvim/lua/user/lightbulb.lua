local status_ok, lightbulb = pcall(require, "nvim-lightbulb")
if not status_ok then
  return
end

lightbulb.setup({
  sign = {
    enabled = true,
    priority = 10,
  },
  autocmd = {
      enabled = false,
      pattern = {"*"},
      events = {"CursorHold", "CursorHoldI"}
  }
})
