function [Basis] = BasisForRowSpace(M,p)
%this function outputs a matrix whose rows form a basis for the row space
%of M over GF(p)

%the following finds the number of non-zero rows of M (i.e. the rank)
[m,n]=size(M);
RM = RowEchelon(M,p);
nonzerorows = 0;
for row = 1:m
    if mod(RM(row,:),p) == zeros(1,n)
        break
    else
        nonzerorows = nonzerorows + 1;
    end
end

%the non-zero rows of the row echelon form of M form a basis for the row
%space of M
Basis = RM(1:nonzerorows,:);
end

