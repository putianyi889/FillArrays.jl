
"""
    Trues = Ones{Bool, N, Axes} where {N, Axes}

Lazy version of `trues` with axes.
Typically created using `Trues(dims)` or `Trues(dims...)`

# Example
```jldoctest
julia> T = Trues(1,3)
1×3 Ones{Bool}

julia> Array(T)
1×3 Matrix{Bool}:
 1  1  1
```
"""
const Trues = Ones{Bool, N, Axes} where {N, Axes}


"""
    Falses = Zeros{Bool, N, Axes}

Lazy version of `falses` with axes.

See also: [`Trues`](@ref)
"""
const Falses = Zeros{Bool, N, Axes} where {N, Axes}


# y[mask] = x when mask isa Trues (cf y[:] = x)

function Base.to_indices(A::AbstractArray{T,N}, inds, I::Tuple{Trues{N}}) where {T,N}
    @boundscheck axes(A) == axes(I[1]) || Base.throw_boundserror(A, I[1])
    (vec(LinearIndices(A)),)
end
