function [Basis] = Kernel(M,p)
%This function finds a basis of the kernel a matrix M over GF(p)
%The columns of the output are the vectors that form the basis of the kernel
[m,n]=size(M);

%The program can use the row echelon form of M, because it has the
%same null space as M
A = RowEchelon(M,p);

%The following finds the the columns of the first 1 in all the 
%non-zero rows
column=1;
row=1;
L=[];
while row < m + 1 && column < n+1
    if mod(A(row,column),p)~=0
        L = [L;column];
        row = row + 1;
    end
    column = column + 1;
end

%The rank is equal to the number of non-zero rows of the row echelon form
rank = length(L);

%The following finds the vectors of a basis
B = [];
for k = 1:n
    v = zeros(n,1);
    %check if k is in w
    if any(L == k) == 0
        v(k) = 1;
        %construct a basis vector
        for i= 1:rank
            v(L(i))= mod(-A(i,k),p);
        end
        %add the vector as another column of B
        B = [B,v];
    end
end

Basis = B;
end

