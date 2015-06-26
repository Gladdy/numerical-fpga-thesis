function [ dx ] = finalOscillation( ~,x )
dx = [0 1 0 0; -1 0 0 0; 0 0 0 1; 0 0 -4 0]*x;
end


