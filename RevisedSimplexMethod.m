%Enter inputs in order: A, B, c, and the inequalities of B (1) means <=  |
%(-1) means => which is wrong

%gets inputs
%matrix
matrix = input('Enter A - matrix : ');
%answers of restrictive functions
answer = input('Enter B - answers : ');
%variables of objective function
objRow = input('Enter C - objective function : ');
%inequalities of answers
answerEquality = input('Enter inequalities of B: -1 for => , 1 for <= : ');

[nRow, nCol] = size(matrix);
%check if enough answers
if length(answer) ~= nRow
    disp("ERROR: more or less answers than rows of the matrix");
    return
end
%check if enough objective variables
if length(objRow) ~= nCol
    disp("ERROR: more or less objective functions than columns of the matrix")
    return
end

%check if enough inequalities
if length(answerEquality) ~= nRow
    disp("ERROR: more or less inequality signs than rows of the matrix");
    return
end

%checks if it is correct standard Max 
for i=1:length(answerEquality)
   if answerEquality(i) == -1
       disp("ERROR: B has a => ");
       return
   end
end
%creates everything needed for the program
[originalMatrix, objRow, Cb, CB, Xb, eMatrix, B, rank, CbVar] = tableauCreator(matrix, objRow, answer);

%gets the initial entering column and checks the status
[eVar, eCount, status] = eColumn(CB, originalMatrix);
mMatrix = createM(CB,B,rank);
[solution] = findSolution(mMatrix,answer);
%disp(status);
i=0;
%status checks if you need to do Revised SImplex Method. 
%i count checks if it is unsolvable 
while(status~=1 && i<100)
    %find departing variable
    [dVar, dCount, Cb, t, tV, CbVar] = dRow(B, Xb, matrix, eCount, Cb, eVar, CbVar);
    %creates eMatrix
    eMatrix=eMatrixCreator(dCount, matrix, t, eMatrix, tV);
    %finds newB and resets eMatrix
    [B, eMatrix, CB] = newB(eMatrix, B, rank, Cb);
    %creates mMatrix
    mMatrix = createM(CB,B,rank);
    %gets the solution
    [solution] = findSolution(mMatrix,answer);
    %checks status again
    [eVar, eCount, status] = eColumn(CB, originalMatrix);
    %disp(status);
    i=i+1;
end
if i<100
    [~, nCol] = size(solution);
    disp("The solution is: (Z, followed by Optimal Objective Values)");
    disp("    z= " + solution(1));
   	disp("x" + CbVar + "=" + solution(2:nCol));
else
    disp("There are no solutions");
end
end