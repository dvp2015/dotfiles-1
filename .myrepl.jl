"""Utilities for Julia REPL.

Rerences:
	[1] Tom Kwang, Hands on Design Patterns and best practices
"""

using Pkg
using REPL

try
    using PkgTemplates
catch
    Pkg.add("PkgTemplates")
    using PkgTemplates
end

"""
    mdcd(dir)

Make directory `dir` and change to it.
"""
mdcd(path::AbstractString; mode::Unsigned=0o777) = cd(mkpath(path; mode))


"""
    edit_startup()

Open user's startup.jl in default editor.

"""
function edit_startup()
    startup = joinpath(homedir(), ".julia", "config", "startup.jl")
    edit(startup)
    return nothing
end


"""
    edit_history()

Open REPL history file.

Use this to extract code snippets from REPL history to files.
"""
edit_history() = edit(REPL.find_hist_file())


"""
    gitlab_template() -> Template

Create template object with defaults appropriate for gitlab.iterrf.ru server.

# Example

```julia
    t = gitlab_template()
    t.julia=v"1.7"
    t("MyPkg")
```
"""
function gitlab_template()::Template
    return Template(;
        julia=VERSION,
        user="dvp",
        authors=["Dmitri Portnov <d.portnov@iterrf.ru>"],
        dir=Pkg.devdir(),
        host="gitlab.iterrf.ru",
        plugins=PkgTemplates.Plugin[
            BlueStyleBadge(), # https://github.com/invenia/BlueStyle
            Citation(),
            Codecov(),
            ColPracBadge(),
            CompatHelper(),
            Coveralls(),
            Develop(),
            Documenter{GitHubActions}(),
            Git(; ignore=[".*", "wrk/", "~*"], ssh=true),
            GitHubActions(),
            GitLabCI(),
            License(; name="MIT", destination="LICENSE"),
            ProjectFile(; version=v"0.1.0"),
            Readme(; inline_badges=true),
            SrcDir(),
            TagBot(),
            Tests(; project=true),
        ],
    )
end

"""
Display the entire type hierarchy starting from the specified `roottype`
"""
function subtype_tree(roottype, level = 1, indent = 4)
	level == 1 && println(roottype)
	for s in subtypes(roottype)
		println(join(fill(" ", level * indent)) * string(s))
		subtype_tree(s, level + 1, indent)
	end
	nothing
end

"""
	pretty_print_stacktrace(trace = stacktrace(catch_backtrace()))
	
	Print exception trace with numbered sections.
	Borrowed from [1], p.335.
"""
function pretty_print_stacktrace(trace = stacktrace(catch_backtrace()))
	for (i,v) in enumerate(trace)	
		println(i, " => ", v)
	end
end

ls(path::AbstractString=pwd()) = foreach(println, sort(readdir(path)))
cdev(subdir::AbstractString...) = cd(joinpath(Pkg.devdir(), subdir...))

"""
	installed_packages(drop_jll=true)
	
	Get list of installed packages.
"""
function installed_packages(drop_jll::Bool=true)::Vector{String}
	result = sort(map( (x)-> x.name, values(Pkg.dependencies())))
	if drop_jll
		result = filter(result) do x
			!match(r"_jll$", x)
		end
	end
	result
end



nothing

