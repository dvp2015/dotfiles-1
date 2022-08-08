atreplinit() do repl

    try
        @eval begin
            using OhMyREPL
            colorscheme!("OneDark")
            OhMyREPL.enable_autocomplete_brackets(true)
            OhMyREPL.Passes.RainbowBrackets.activate_256colors()
            # On vscode terminal on windows this breaks prompt and input focus, this is a solution 
            vscode_terminal = get(ENV, "TERM_PROGRAM", nothing) == "vscode"
            vscode_terminal || OhMyREPL.input_prompt!("👠> ")  
        end
    catch e
        display("Cannot use OhMyREPL: $e.msg")
    end

    try
        @eval begin
            using Revise
        end
    catch e
        display("Cannot use Revise: $e.msg")
    end

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
            editors = ["code", "vim"]
			if Sys.iswindows()
                push!(
                    editors, 
                    "d:\\tools\\VSCode\\Code.exe",
                    "C:\\Program Files\\Notepad++\\notepad++.exe",
                    "notepad.exe"
                )
            end 
            editor_idx = findfirst(Sys.isexecutable, editors)
            if editor_idx !== nothing
                editor = editors[editor_idx]
                if occursin(r"[ \\]", editor) 
                    editor = "\"$editor\""  # force to be a single entry on shell_split call
                end
			    ENV["JULIA_EDITOR"] = editor
             
            end
        end
        myrepl() = joinpath(homedir(), ".myrepl.jl")
        imyrepl() = include(myrepl())
        emyrepl() = edit(myrepl())
    end

end



