using CSV, DataFrames
df = CSV.read("data_with_classes.csv",DataFrame)
# println(df.Class)
global matclass1=Array{Any}(undef, 0)
global matclass2=Array{Any}(undef, 0)
global matclass3=Array{Any}(undef, 0)

for row in eachrow(df)
    global matclass1,matclass2,matclass3
    data = row.Class
    if data == 1 
        push!(matclass1,row[1:5])
    end
    if data == 2 
        push!(matclass2,row[1:5])
    end
    if data == 3
        push!(matclass3,row[1:5])
    end
end

println(matclass1)
println(matclass2)
println(matclass3) 