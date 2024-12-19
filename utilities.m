% Euclidean Distance function
function d = disteu(x, y)
    [M, N] = size(x);
    [M2, P] = size(y);
    if M ~= M2
        error('Matrix dimensions do not match.');
    end
    d = zeros(N, P);
    for ii = 1:N
        for jj = 1:P
            d(ii, jj) = mydistance(x(:, ii), y(:, jj), 2);
        end
    end
end

% Mydistance function for weighted Euclidean distance
function out = mydistance(x, y, tipo)
    if tipo == 0
        out = sum((x - y).^2).^0.5;
    else
        out = (sum((x - y).^2)).^0.5;
    end
end
