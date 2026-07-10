local function paste_image()
    local img_dir = "images"

    -- Ask user for image name
    local user_input = vim.fn.input("Image name (without extension): ")
    if user_input == "" then
        vim.api.nvim_err_writeln("Image name is required.")
        return
    end

    -- Create full filename with timestamp to avoid overwrites
    local img_name = user_input .. ".png"
    local full_path = img_dir .. "/" .. img_name

    -- Ensure directory exists
    vim.fn.mkdir(img_dir, "p")

    local save_cmd
    if vim.fn.executable("xclip") == 1 then
        save_cmd = "xclip -selection clipboard -t image/png -o > " .. full_path
    else
        vim.api.nvim_err_writeln("No supported clipboard image tool found!")
        return
    end

    os.execute(save_cmd)

    -- Insert LaTeX line
    local rel_path = img_dir .. "/" .. img_name
    local tex_line = "\\includegraphics[scale=0.5]{" .. rel_path .. "}"
    vim.api.nvim_put({
        "\\begin{center}",
        tex_line,
        "\\end{center}"
    }, "l", true, true)
end

-- Optional: expose globally
_G.paste_image = paste_image
