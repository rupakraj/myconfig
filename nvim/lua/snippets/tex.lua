local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node


ls.add_snippets("tex", {
    s("blankframe", {
        t({ "\\begin{frame}[fragile]{" }),
        i(1, "Title"),
        t({ "}", "    " }),
        i(0),
        t({ "", "\\end{frame}" })
    }),

    -- Frame with hone and htwo
    s("frame-header", {
        t({ "\\begin{frame}[fragile]{" }), i(1), t({ "}",
        "    \\hone{title}",
        "",
        "    \\htwo{subtitle}",
        "\\end{frame}" }),
    }),

    -- Frame blank
    s("frame-blank", {
        t({ "\\begin{frame}[fragile]{" }), i(1, "title"), t({ "}", "    ", "\\end{frame}" }),
    }),

    -- LaTeX Figure
    s("figure", {
        t({
            "\\begin{figure}[h]",
            "    \\centering",
            "    \\includegraphics[scale=0.8]{"
        }), i(1, "image.png"), t({ "}",
        "    \\caption{" }), i(2, "Caption"), t({ "}",
        "    \\label{fig:" }), i(3, "label"), t({ "}",
        "\\end{figure}" }),
    }),

    -- LaTeX Table
    s("table", {
        t({
            "\\begin{table}[h]",
            "    \\centering",
            "    \\begin{tabular}{|c|c|c|}",
            "        \\hline",
            "        "
        }), i(1, "Header 1"), t(" & "), i(2, "Header 2"), t(" & "), i(3, "Header 3"), t({ " \\\\",
        "        \\hline",
        "        "
    }), i(4, "Data 1"), t(" & "), i(5, "Data 2"), t(" & "), i(6, "Data 3"), t({ " \\\\",
        "        \\hline",
        "    \\end{tabular}",
        "    \\caption{"
    }), i(7, "Table Caption"), t({ "}",
        "    \\label{tab:"
    }), i(8, "label"), t({ "}",
        "\\end{table}" }),
    }),

    -- Equation Environment
    s("equation", {
        t({ "\\begin{equation}", "    \\label{eq:" }), i(1, "label"), t({ "}",
        "    " }), i(2, "E = mc^2"), t({ "",
        "\\end{equation}" }),
    }),

    -- Inline Math
    s("math", {
        t("$$"), i(1, "math"), t("$$")
    }),

    -- Itemized List
    s("itemize", {
        t({ "\\begin{itemize}", "    \\item " }), i(1, ""), t({ "", "\\end{itemize}" }),
    }),

    -- Enumerated List
    s("enumerate", {
        t({ "\\begin{enumerate}", "    \\item " }), i(1, ""), t({ "", "\\end{enumerate}" }),
    }),

    -- Frame with multiple columns
    s("frame-multi-columns", {
        t({ "\\begin{frame}[fragile]{" }), i(1), t({ "}",
        "    \\begin{columns}",
        "        \\begin{column}{0.48\\textwidth}",
        "        \\end{column}",
        "        \\begin{column}{0.48\\textwidth}",
        "        \\end{column}",
        "    \\end{columns}",
        "\\end{frame}" }),
    }),

    -- Multiple columns
    s("columns", {
        t({
            "    \\begin{columns}",
            "        \\begin{column}{0.48\\textwidth}",
            "        \\end{column}",
            "        \\begin{column}{0.48\\textwidth}",
            "        \\end{column}",
            "    \\end{columns}",
        }),
    }),

    -- Bold Text
    s("bold", {
        t("\\textbf{"), i(1), t("}")
    }),

    -- Italic Text
    s("italic", {
        t("\\textit{"), i(1), t("}")
    }),

    -- Equation multicase
    s("equation-multicase", {
        t({
            "\\begin{equation}",
            "    f(x)=",
            "         \\begin{cases}",
            "            1, & \\text{if $x<0$}\\\\",
            "            0, & \\text{otherwise}",
            "       \\end{cases}",
            "\\end{equation}",
        }),
    }),
})
