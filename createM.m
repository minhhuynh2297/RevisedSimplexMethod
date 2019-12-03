function mMatrix = createM(CB,B,originalSize)
%creates an identity matrix of one larger size than our c+A matrix
%adds in C*B vector and B matrix into the right place of the M Matrix
mMatrix=eye(originalSize+1);
[nRow, nCol] = size(mMatrix);
    for i=1:(nCol)-1
        mMatrix(1, i+1) = CB(1, i);
    end

    for j=1:(nCol)-1
        for k=1:nRow-1
            mMatrix(k+1, j+1) = B(k, j);
        end
    end
end
