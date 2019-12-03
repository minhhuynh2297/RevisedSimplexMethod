function [solutionVector] = findSolution(mMatrix,answers)
%find z and variables by multiplying mMatrix with answers
b = zeros(length(answers)+1, 1);
    for i=1:length(answers)
        b(i+1, 1)=answers(i);
    end
     solutionVector=(mMatrix*b)';
     
end
