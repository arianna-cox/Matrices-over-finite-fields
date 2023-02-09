function [InversesList] = inverses(p)
%This function outputs an array of the inverses of the non-zero 
%integers modulo p
list = zeros(p-1,1);

for a = 1:p-1
  for b = 1:p-1
    %The following checks if b is the inverse of a. If it is, it stores b
    %in the ath position of list.
    if mod(a*b,p)==1
        list(a) = b;
        break
    end
  end
end

InversesList = list;
end