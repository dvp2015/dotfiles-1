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
        @eval OhMyREPL.enable_autocomplete_brackets(false)
    catch
        @warn "OhMyREPL package is not available, add it with Pkg"
    end
end
using Random

ENV["JULIA_EDITOR"] = "vim"
