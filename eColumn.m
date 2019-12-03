function [eVar, eCount, status] = eColumn(CB, originalMatrix)
%takes in individual columns of the c + A matrix and multiplies with [1 CB]
%any negative leads to -1 status (continue the program) and assigns the
%eCount which will be the column number, and eVar (which is the objective
%row number entering the Cb
eCount=1;
status=-1;
num = 0;
Z=zeros(1, length(CB));
    Z(1) = 1;
    for i=1:length(CB)
        Z(i+1)=CB(i);
    end
    
    [nRow, nCol] = size(originalMatrix);
    for i = 1:nCol
        originalMatrix(1, i) = -originalMatrix(1, i);
    end
    temp = zeros(1, nRow);
    j=nRow;
    
    temp = originalMatrix(1:nRow);
    num = Z * temp';
    eVar = -originalMatrix(1:1);
    if (nRow > 1)
        for i=1:nCol
        temp=originalMatrix((j*(i-1)+1 : j*i));
            if (Z * temp') < num 
                num = (Z * temp');
                eVar = -originalMatrix(1, i);
                eCount = i;
            end
        end
    end

    if num >= 0
        status = 1;
    end

    if round(num) == 0
        status = 1;
    end
end
