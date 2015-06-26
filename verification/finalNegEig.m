function [ dx ] = finalNegEig( ~,x)
dx = [2 3 2 0; -5 -5 -3 1; 3 -1 -2 -3; 4 2 2 -3; ]*x;
end

