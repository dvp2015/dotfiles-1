using Pkg: Pkg

atreplinit() do repl

    try
        @eval begin
            using OhMyREPL
            colorscheme!("OneDark")
            OhMyREPL.enable_autocomplete_brackets(true)
            OhMyREPL.Passes.RainbowBrackets.activate_256colors()
            # On vscode terminal on windows this breaks prompt and input focus, the following is a solution 
            let use_default_prompt = Sys.iswindows() && get(ENV, "TERM_PROGRAM", nothing) == "vscode"
                use_default_prompt || OhMyREPL.input_prompt!("👠> ")  
            end
        end
    catch e
        @warn "Cannot use OhMyREPL: $e.msg"
    end

    #  TODO dvp: Revise issues a lot of warnings on 1.11.5 when Pluto is precompile
      #            Do I neeed Revise?
    # try
    #     @eval using Revise
    # catch e
    #     @warn "Cannot use Revise: $e.msg"
    # end

    # TODO dvp: check TerminalLoggers - precompile failed
    # try
    #     @eval begin
    #         using Logging: global_logger
    #         using TerminalLoggers: TerminalLogger
    #         global_logger(TerminalLogger())
    #     end
    # catch e
    #     display("Cannot use TerminalLoggers: $e.msg")
    # end

    @eval begin
        if "JULIA_EDITOR" ∉ keys(ENV) 
            editors = ["code", "neovim", "vim"]
            if Sys.iswindows()
                push!(
                    editors,
                    "$(homedir())\\AppData\\Local\\Programs\\Microsoft VS Code\\Code.exe",
                    "C:\\Program Files\\Notepad++\\notepad++.exe",
                    "notepad.exe"
                )
            end 
            editor = something(map(Sys.which, editors)...)
            if Sys.iswindows() && occursin(r"[ \\]", editor) 
                editor = "\"$editor\""  # force to be a single entry on shell_split call
            end
            ENV["JULIA_EDITOR"] = editor
        end
        myrepl() = joinpath(homedir(), ".myrepl.jl")
        imyrepl() = include(myrepl())
        emyrepl() = edit(myrepl())
    end

end



