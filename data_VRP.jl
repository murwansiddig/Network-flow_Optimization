data_file = read("A-n32-k5.dat",String);
data_file = split(data_file, "\n");

first_row = [];
temp = split(data_file[1][2:end-1],",");
for i=1:length(temp)
    push!(first_row,parse(Int64,temp[i]))
end
nn = first_row[1]; #Number of nodes/cities to be served 
Q = first_row[2]; #Capactiy of vehicles
nv = first_row[3]; #Number of vehicles

second_row = [];
temp = split(data_file[2][2:end-1],",");
for i=1:length(temp)
    push!(second_row,parse(Int64,temp[i]))
end
q = second_row;


temp_third_row = [];
temp = split(data_file[3],"],");

for i=1:length(temp)
    ins_temp = [];
    if i == 1
        ins_temp = split(temp[i][3:end],",");
    elseif i == length(temp)
        ins_temp = split(temp[i][2:end-2],",");
    else
        ins_temp = split(split(temp[i],"[")[2],",");
    end
    local_temp = [];
    for j=1:length(ins_temp)        
        push!(local_temp,parse(Int64,ins_temp[j]))
    end
    push!(temp_third_row,local_temp)
end
third_row = zeros(length(temp_third_row),length(temp_third_row[1]));
for i=1:length(temp_third_row)
   third_row[i,:] = temp_third_row[i] 
end
#A pairwise matrix for the distance between each pair of nodes/cities
c = third_row;
c = reshape(c, nn, nn)
c = c';


