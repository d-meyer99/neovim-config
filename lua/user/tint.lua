local status_ok, tint = pcall(require, "tint")
if not status_ok then
    return
end

tint.setup({
    tint = -70,
    saturation = 0.3,
    tint_background_colors = false,
})
