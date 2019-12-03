function [originalMatrix, objRow, Cb, CB, Xb, eMatrix, B, rank, CbVar] = tableauCreator(matrix, objRow, Answers)
%Takes in a matrix (A), objRow (c), answerEquality, and Answers (B)
%Turns it into a big matrix that has the c on A
%Adds in the identity matrix, as well as the 0's at the end of c
%Also creates the rest of the things needed like Cb, CB, Xb, eMatrix, B


[nRow, nCol] = size(matrix);
rank=nRow;
newCol = nCol+rank;
originalMatrix=zeros(nRow+1, newCol);
oldObj = objRow;
objRow = zeros(1, newCol);

for i=1:nCol
    objRow(i) = oldObj(i);
end

for i=nCol+1:newCol
    objRow(i)=0;
end



for i=1:newCol
    originalMatrix(1, i)=objRow(i);
end

for i=1:nRow
    for j=1:nCol
       originalMatrix(i+1, j) = matrix(i, j);
    end
end

for i=1:nRow
    originalMatrix(i+1, nCol+1) = 1;
end

    eMatrix=eye(rank);
    B=eye(rank);
    Cb=zeros(1, nRow);
    CbVar=zeros(1, nRow);
    for i=1:nRow-1
        CbVar(1, nRow-i) = nCol-(i-1);
    end
    CB = Cb * B;
    Xb = Answers;
end
