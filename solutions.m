clear;
clc;
close;

% ASSIGNMENT 1 MATLAB
% GROUP: GetThat°
% CONWAY'S GAME OF LIFE

% Initialisation: generate random matrix of size N
N = 10;
current_gen = zeros(N+2, N+2);
current_gen(2:N+1, 2:N+1) = sprand(N, N, 0.5);

% Counting live neighbours
for i = 1:N;
    for r = 2:N+1;
        for c = 2:N+1;
            diag = current_gen(r-1, c-1) + current_gen(r-1, c+1) + current_gen(r+1, c-1) + current_gen(r+1, c+1);
            horver = current_gen(r-1, c) + current_gen(r+1, c) + current_gen(r, c-1) + current_gen(r, c+1);
            num_alive = diag + horver;
        endfor
    endfor
endfor

% updating the new cells according to the rules
for k = 1:5;
    new_gen = current_gen;
    for r = 2:N+1;
      for c = 2:N+1;
    if (new_gen(r,c) == 1) && ((num_alive == 2) || (num_alive == 3))
       (new_gen(r,c) == 1);
    elseif (new_gen(r,c) == 1) && ((num_alive < 2) || (num_alive > 3))
           (new_gen(r,c) == 0);
    elseif (new_gen(r,c) == 0) && (num_alive == 3)
           (new_gen(r,c) == 1);
    endif
      end
   end
end
