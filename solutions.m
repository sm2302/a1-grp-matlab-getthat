clear;
clc;
close;

% ASSIGNMENT 1 MATLAB
% CONWAY'S GAME OF LIFE

% Initialisation: generate random matrix of size N
N = 10;
current_gen = zeros(N+2, N+2);
current_gen(2:N+1, 2:N+1) = sprand(N, N, 0.5);


