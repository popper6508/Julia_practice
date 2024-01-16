using LinearAlgebra
using Pkg
using Plots
using PyCall
using CSV
using Knet

using XLSX

using Dates
using Downloads

raw_data = data = DataFrame(XLSX.readtable("./data_raw_weekly.xlsx", "Weekly_KR"))

tcode = raw_data[1, :]

data = raw_data[2:end, :]

tdata = data[!, 1:2]

for i in 3:size(data, 2)
    if tcode[i] == 1
        tdata[!, i] .= data[!, i]
    elseif tcode[i] == 2
        tdata[!, i] .= diff(data[!, i])
    elseif tcode[i] == 4
        tdata[!, i] .= log.(data[!, i])
    elseif tcode[i] == 5
        tdata[!, i] .= diff(log.(data[!, i]))
    elseif tcode[i] == 6
        tdata[!, i] .= diff(diff(log.(data[!, i])))
    elseif tcode[i] == 7
        tdata[!, i] .= diff(data[!, i] ./ data[1:end-1, i])
    end
end

row_names = tdata[!, 1]

data_use = select(tdata, Not(1))
