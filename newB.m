function [newB, eMatrix, CB] = newB(eMatrix, oldB, originalSize, Cb)
%takes in eMatrix, and multiplies it with the old B matrix 
%to find a new B matrix
%Also resets the eMatrix to an identity matrix
%Updates the Cb*B vector
newB=eMatrix*oldB;
eMatrix=eye(originalSize);
CB=Cb*newB;
end
