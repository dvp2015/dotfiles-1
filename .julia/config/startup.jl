using OhMyREPL
colorscheme!("OneDark")
OhMyREPL.enable_autocomplete_brackets(true)
OhMyREPL.Passes.RainbowBrackets.activate_256colors()
OhMyREPL.input_prompt!("👠> ")

if "JULIA_EDITOR" ∉ keys(ENV) && Sys.isexecutable("vim")
    ENV["JULIA_EDITOR"] = "vim"
end

myrepl() = joinpath(homedir(), ".myrepl.jl")
imyrepl() = include(myrepl())
emyrepl() = edit(myrepl())

