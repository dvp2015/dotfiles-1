atreplinit() do repl
    @async try
        sleep(0.1)
        @eval using Revise
        @async Revise.wait_steal_repl_backend()
    catch
        @warn("Could not load Revise.")
    end
    try
        @eval using OhMyREPL
        @eval colorscheme!("OneDark")
        @eval OhMyREPL.enable_autocomplete_brackets(false)
    catch e
        @warn "error while importing OhMyREPL" e
    end
end
using Random

ENV["JULIA_EDITOR"] = "vim"
