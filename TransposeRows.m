function [OutputMatrix] = TransposeRows(M, i, j)
%This function transposes rows i and j of M

%Check that i and j do not exceed the number of rows of M
[m,n]=size(M);
if i>m | j>m
    error('i or j exceeds the number of rows of the matrix')
end

%Save row j
Rowj= M(j,:);
%Replace row j by row i
M(j,:)=M(i,:);
%Replace row i by row j
M(i,:)=Rowj;

OutputMatrix = M;
end

