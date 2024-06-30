local status_ok, tint = pcall(require, "tint")
if not status_ok then
    return
end

tint.setup({
    tint = -100,
    saturation = 0.5,
    tint_background_colors = false,
})
