function [RowEchelonForm] = RowEchelon(M, p)
%This function puts a matrix over GF(p) into row echelon form
[m,n]=size(M);

k = 1;
for column = 1:n
    %Look for a non-zero entry in the column, in rows k to m
    for row = k:m
        if mod(M(row,column),p)~=0
            %Move the row of the non-zero entry to the kth position
            M = TransposeRows(M,k,row);
            %Divide the kth row by a constant such that the first non-zero
            %entry in row k equals 1
            M = DivideRow(M,p,k,mod(M(k,column),p));
            %Make all other entries of the column, equal zero
            for h=1:k-1
                M = SubtractRows(M,p,h,M(h,column),k);
            end
            for h=k+1:m
                M = SubtractRows(M,p,h,M(h,column),k);
            end
            k = k + 1;
            break
        end
    end
end

RowEchelonForm = M;
end

