#=
Utilities for Julia REPL.

References:
	[1] Tom Kwang, Hands on Design Patterns and best practices
=#

using Pkg
using REPL

try
    using PkgTemplates
catch
    Pkg.add("PkgTemplates")
    using PkgTemplates
end

using LibGit2

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
    t.julia=v"1.9"
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
            Citation(),
            Develop(),
            Documenter{GitLabCI}(),
            Git(; ignore=[".*", "wrk/", "~*"], ssh=true),
            GitLabCI(),
            License(; name="MIT", destination="LICENSE"),
            ProjectFile(; version=v"0.1.0"),
            Readme(; inline_badges=true),
            SrcDir(),
            TagBot(),
            Tests(; project=true),
        ]
    )
end


function gitkw!(kwargs, k, default, section)
    res = pop!(kwargs, k, nothing)
    res !== nothing && return res
    LibGit2.getconfig("$(section).$(String(k))", default)
end

githubkw!(kwargs, k, default) = gitkw!(kwargs, k, default, "github")


"""
    github_template() -> Template

Create template object with defaults appropriate for github.com/dvp2015 repositories.

# Example

```julia
    t = github_template(dir="~/dev/julia")
    t("MyPkg")
```
"""
function github_template(;kwargs...)::Template
    kwargs = Dict(kwargs)
    user = githubkw!(kwargs, :user, "dvp2015")
    email = githubkw!(kwargs, :email, "dmitri_portnov@yahoo.com")
    return Template(;
        julia=pop!(kwargs, :julia, "1.6.7"),  # stable version
        user=user,
        authors=githubkw!(kwargs, :authors, "$user <$email>"),
        plugins=PkgTemplates.Plugin[
            Citation(),
            Codecov(),
            CompatHelper(),
            Develop(),
            Documenter{GitHubActions}(),
            Git(; ignore=[".*", "wrk/", "~*"], name=user, email=email, branch="master"),
            GitHubActions(),
            RegisterAction(),
            License(; name="MIT", destination="LICENSE"),
            ProjectFile(; version=v"0.1.0"),
            Readme(; inline_badges=true),
            SrcDir(),
            TagBot(),
            Tests(; project=true),
        ],
        kwargs...
    )
end

"""
Display the entire type hierarchy starting from the specified `roottype`
"""
function subtype_tree(roottype, level=1, indent=4)
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
function pretty_print_stacktrace(io::IO, trace=stacktrace(catch_backtrace()))
    for (i, v) in enumerate(trace)
        println(io, i, " => ", v)
    end
end

pretty_print_stacktrace(trace=stacktrace(catch_backtrace())) =
    pretty_print_stacktrace(Base.stderr, stacktrace(catch_backtrace()))

ls(path::AbstractString=pwd()) =
    foreach(println, sort(readdir(path)))
ls(f::Function, path::AbstractString=pwd()) =
    foreach(println, sort(filter(f, readdir(path))))

cdev(subdir::AbstractString...) =
    cd(joinpath(Pkg.devdir(), subdir...))

"""
	installed_packages()

Get list of all the installed packages.
"""
installed_packages() = sort(map(x -> x.name, values(Pkg.dependencies())))

"""
	installed_packages(filter)

Get list of the installed packages with names matching predicate `filter`.

# Example

```julia
julia> installed_packages(!endswith("_jll"))
...
julia> installed_packages() do package
           'I' ∈ package
       end
...
```
"""
installed_packages(filter) = Base.filter(filter, installed_packages())




nothing
