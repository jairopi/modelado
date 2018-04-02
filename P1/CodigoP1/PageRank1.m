function [r i] = PageRank(A,alpha)

N = size(A,1);
Q = zeros(N,N);
n = sum(A,2); % cantidad de referencias de cada uno de los i, te devuelve un vector columna
ones_N = ones(N,N);

for i=1:N
    for j=1:N
% A en i,j tiene una referencia!! match
        if(A(i,j)==1) 
%Q(i,j) será inversamente proporcional al numero de referencias efectuadas
%por i (cuantas más referencias haya hecho i menos importante será que una
%página haya sido referenciada por ella.
            Q(i,j)=1/n(i);
        end
    end
end

M = alpha * Q + ( (1-alpha) / N ) * ones_N;
v = SolveErgodicDTMC(M);
[r i] = sort(v, 'descend');

end
