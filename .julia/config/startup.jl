atreplinit() do repl

    try
        @eval begin
            using OhMyREPL
            colorscheme!("OneDark")
            OhMyREPL.enable_autocomplete_brackets(true)
            OhMyREPL.Passes.RainbowBrackets.activate_256colors()
            OhMyREPL.input_prompt!("👠> ")
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

    try
        @eval begin
            using Logging: global_logger
            using TerminalLoggers: TerminalLogger
            global_logger(TerminalLogger())
        end
    catch e
        display("Cannot use TerminalLoggers: $e.msg")
    end

    @eval begin
        if "JULIA_EDITOR" ∉ keys(ENV) && Sys.isexecutable("vim")
            ENV["JULIA_EDITOR"] = "vim"
        end

        myrepl() = joinpath(homedir(), ".myrepl.jl")
        imyrepl() = include(myrepl())
        emyrepl() = edit(myrepl())
    end

end



