atreplinit() do repl
    @async try
        sleep(0.1)
        @eval using Revise
        @async Revise.wait_steal_repl_backend()
    catch
        @warn "Package Revise is not available, add it with Pkg"
    end

    try
        @eval using OhMyREPL
        @eval colorscheme!("OneDark")
        @eval OhMyREPL.enable_autocomplete_brackets(true)
        @eval OhMyREPL.Passes.RainbowBrackets.activate_256colors()
    catch
        @warn "OhMyREPL package is not available, add it with Pkg"
    end

    if "JULIA_EDITOR" ∉ keys(ENV) && Sys.isexecutable("vim")
        ENV["JULIA_EDITOR"] = "vim"
    end
end

dvprepl() = expanduser("~/.dvprepl.jl")
