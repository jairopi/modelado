function [r i] = PageRank(A, alpha)
N = length(A);
Q = ((1./sum(A,2))*ones(1,N)).*A;
M = alpha * Q + (1-alpha)*ones(N,N)/N;
h = SolveErgodicDTMC(M);
[r i] = sort(h, 'descend');
end