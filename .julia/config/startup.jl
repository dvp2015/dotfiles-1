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

   ( "JULIA_EDITOR" in keys(ENV) ) || Sys.isexecutable("vim") && ( ENV["JULIA_EDITOR"] = "vim" )
 
end

# TODO dvp: move the following to a special package to provide some utilities both in REPL and scripts

"""
    mdcd(dir)

Make directory `dir` and change to it.

"""
mdcd(path::AbstractString; mode::Unsigned = 0o777) = mkpath(path; mode) |> cd


# TODO dvp: move the following to a special package to customize my REPL only (in interactive mode)

"""
    editstartup()

Open user's startup.jl in default editor.

"""
function editstartup()
     home = ENV[Sys.iswindows() ? "USERPROFILE" : "HOME"]
     startup = joinpath(home, ".julia", "config", "startup.jl")
     edit(startup)
end


