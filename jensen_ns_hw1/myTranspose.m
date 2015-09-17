function [ transpose ] = myTranspose( matrix )
% 

    [M, N] = size(matrix);% get the size of the current matrix
    transpose = zeros(N, M);% init the size of the new matrix
    
    for i = 1:M
        for j = 1:N
            transpose(j,i) = matrix(i,j);% switch down the main diagnal
        end
    end

end

