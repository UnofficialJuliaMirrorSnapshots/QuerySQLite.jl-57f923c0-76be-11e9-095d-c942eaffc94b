module QuerySQLite

import Base: !, &, |, ==, !=, *, +, %, abs, Char, coalesce, collect, eltype, getproperty, length,
lowercase, in, isdone, isequal, isless, ismissing, iterate, IteratorSize, max, min,
occursin, rand, show, showerror, startswith, string, uppercase
using Base: Generator, NamedTuple, RefValue, SizeUnknown, tail
using Base.Meta: quot
import Base.Multimedia: showable
using DataValues: DataValue
import IteratorInterfaceExtensions: getiterator, isiterable
import MacroTools
using MacroTools: @capture
import QueryOperators
import SQLite
import SQLite: getvalue
using SQLite: columns, DB, execute!, generate_namedtuple, juliatype,
SQLITE_DONE, SQLITE_NULL, SQLITE_ROW, sqlite3_column_count, sqlite3_column_name,
sqlite3_column_type, sqlite3_step, sqlitevalue, Stmt, tables
using TableShowUtils: printdataresource, printHTMLtable, printtable
import TableTraits: isiterabletable

export Database

include("utilities.jl")
include("database.jl")
include("code_instead.jl")
include("iterate.jl")
include("model_row.jl")
include("translate.jl")
include("show.jl")

# To add support for a new function
# 1) Use `@code_instead` to specify the argument types
# 2) If the function modifies the model row, define model_row_call(::typeof(function), ...)
# 3a) If the function maps directly onto an SQL function, use @translate_default function SQL_function_symbol
# 3b) Otherwise, define translate_call(::typeof(function), ...)
# 4) If the SQL function uses special syntax, special case the SQLExpression show method

# There are two situtations in which Julia code cannot be translated into SQL
# 1) Patterns based on non-functions or non-overloadable functions, e.g. if, &&. Use if_else and & instead
# 2) Separate operations in SQL that are combined in Julia by dispatch, e.g. * for string concatention. Use `string` instead

end # module
