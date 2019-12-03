function eMatrix = eMatrixCreator(dCount, matrix, t, ematrix, tV)
%creates the eMatrix
%uses dCount to find the column of the eMatrix to put in
%uses tV and t to create the nVector
%applies on ematrix
eMatrix = ematrix;
[nRow, nCol] = size(matrix);
    for i=1:nRow
        if tV(i, 1)==t
            eMatrix(i, dCount) = 1/t;
        else
            eMatrix(i, dCount)=-(tV(i, 1)/t);
        end
    end
end
