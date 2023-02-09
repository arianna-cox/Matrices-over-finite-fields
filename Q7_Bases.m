function [BasisU, BasisW, BasisUsumW, BasisUintersectW] = Q7_Bases(A,B,p)

%the non-zero rows of the row echelon form of A forms a basis for U
BasisU = BasisForRowSpace(A,p);

%the non-zero rows of the row echelon form of B forms a basis for W
BasisW = BasisForRowSpace(B,p);

C = [BasisU; BasisW];
%the non-zero rows of the row echelon form of C forms a basis for U+W
BasisUsumW = BasisForRowSpace(C,p);

%the annihilators Uo and Wo are equal to the kernels of A and B
%respectively
BasisUo = Kernel(A,p);
BasisWo = Kernel(B,p);

%the row vectors of BasisUosumWo form a basis for Uo + Wo (when viewed as a
%row space)
D = [BasisUo.'; BasisWo.'];
BasisUosumWo = BasisForRowSpace(D,p);

%find basis for the annhilator of Uo +Wo
K = Kernel(BasisUosumWo,p);

%the annhilator of Uo + Wo equals U intersect W
BasisUintersectW = K.';
end

