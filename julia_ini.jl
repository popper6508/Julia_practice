println("helloworld")

# using Pkg

# Pkg.add("Plots")
# Pkg.add("Distributions")
# Pkg.add("CSV")

using LinearAlgebra
using Pkg
using Plots
using PyCall
using CSV
using Knet

packages = [:CSV, :DataFrames, :LinearAlgebra, :Plots, :Knet, :PyCall]
for package in packages
    @eval using $(package)
end

np = pyimport("numpy")

f = np.load("f.npy")
Rf = np.load("Rf.npy")

p1 = heatmap(reverse(f, dims=1), color=:viridis)
p2 = heatmap(reverse(Rf, dims=1), color=:viridis)
plot(p1, p2, size=(728,250))

using CSV, DataFrames
data = CSV.read("example.csv", DataFrame)

rand(Float64, 2, 3)

rand((2, 3))

using Random

Random.seed!(0)
rand(1)
rand(1)
rand(1)

Random.seed!(0)
rand(3)

rand([2,3,4,5])

d = Dict(2=>4, 3=>5, 4=>"6")

rand(d)

str = "freshrimpsushi"

rand(str,2)

rand(ComplexF32, 3)

A = rand(0:9, 3,4)

a = rand()

A .+ a

t(x) = x^2 + 1

t(a)

t.(A)

@time for x in 1:1000000
    sqrt(x)
end

@time sqrt.(1:1000000) ;

# Set1 : Using iterative code
z = []
@time for x in 1:100000
    push!(z, sqrt(x))
end

# Set2 : Using broadcast
@time y = sqrt.(1:100000)

@.t(A) ## macro : add "." behind @.

## Check Working Directory
pwd()

## Check Location where the file is in 
@__DIR__

## Julia has log function which can cover complex number also.
## But unpredictable / unintentional calculation can lead to problem
## So we have to make function using error / @error macro
function Rlog(x)
    if typeof(1 + 2im) <: Real
        return log(x)
    else
        error(DomainError, ": Rlog allow real number only")
    end
end

Rlog(1 + 2im)

function Rlog2(x)
    if typeof(1 + 2im) <: Real
        return log(x)
    else
        @error "Rlog2 also allow Real number only"
    end
end

Rlog(1+2im)

using Base.Threads

@time for i in 1:10
    println(i^2)
end

@time @threads for i in 1:10
    println(i^2)
end
α =1
α² = 1
sin.(1:10)

x = 0
while x < 10
    x += 1
    print("$x - ")
end

for i in 1:10
    print("$i - ")
end

for i ∈ 1:10
    print("$i - ")
end

X = 1:4; Y = 8:(-1):5

for x ∈ X
    for y ∈ Y
        print("  ($x + $y) = $(x + y)")
        if y == 5 println() end
    end
end

for (x,y) ∈ zip(X, Y)
    print("  ($x + $y) = $(x + y)")
    if y == 5 println() end
end

function foo0(x, option = 0)
    if option == 0
        return string(x)
    elseif option == 1
        return Int(x)
    else
        error("wrong")
    end
end

