clear;
clc;
close;

% ASSIGNMENT 1 MATLAB
% GROUP: GetThat°
% CONWAY'S GAME OF LIFE

% Initialisation: generate random matrix of size N
N = 100;
p = 0.5;

current_gen = zeros(N+2, N+2);
current_gen(2:N+1, 2:N+1) = sprand(N, N, 0.5);
new_gen = (current_gen < p);

% Counting live neighbours
for i = 1:N
  current_gen = zeros(N+2, N+2);
    for r = 2:N+1; % rows of the current_gen matrix
        for c = 2:N+1; % columns of the current_gen matrix
            % count diagonal living neighbours
            diag = new_gen(r-1, c-1) + new_gen(r-1, c+1) + new_gen(r+1, c-1) + new_gen(r+1, c+1);
            % count the neighbours in the North, East, South and West directions
            nesw = new_gen(r-1, c) + new_gen(r+1, c) + new_gen(r, c-1) + new_gen(r, c+1);
            % total no.of live neighbours
            num_alive = diag + nesw;

            % Update cells according to the rules
            if (new_gen(r,c) == 1) && ((num_alive == 2) || (num_alive == 3))
              current_gen(r,c) == 1;
            elseif (new_gen(r,c) == 1) && ((num_alive < 2) || (num_alive > 3))
              current_gen(r,c) == 0;
            elseif (new_gen(r,c) == 0) && (num_alive == 3)
              current_gen(r,c) == 1;
            endif
        end
    end

    new_gen = current_gen;
    pcolor(new_gen)
    pause(0.01);
end


