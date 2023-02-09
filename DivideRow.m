function [OutputMatrix] = DivideRow(M,p,i,a)
%This function takes a matrix M over GF(p) and divides its ith row by a

%Check that a is non-zero
b=mod(a,p);
if b==0
    error('The element a must be non-zero')
end

%Find the inverse of a
I=inverses(p);
ainverse = I(b);

[m,n]=size(M);

%Divide row i by a
M(i,:)= mod(ainverse*M(i,:),p);

OutputMatrix = M;
end

