function [OutputMatrix] = SubtractRows(M,p,i,a,j)
%This function takes the matrix M over GF(p) and
%subtracts a times row j from row i 

%Check that i and j do not exceed the number of rows of M
[m,n]=size(M);
if i>m | j>m
    error('i or j exceeds the number of rows of the matrix')
end

%Check that i and j are distinct
if i==j
    error('i and j must be distinct')
end

%Subtract a times row j from row i
M(i,:) = mod(M(i,:)-a*M(j,:), p); 

OutputMatrix = M;
end