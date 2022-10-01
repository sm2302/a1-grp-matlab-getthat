clear;
clc;
close;

% ASSIGNMENT 1 MATLAB
% GROUP: GetThat°

% CONWAY'S GAME OF LIFE
% Rules of game:
% 1. Any live cell with fewer than two live neighbours dies (underpopulation).
% 2. Any live cell with two or three live neighbours lives on to the next generation.
% 3. Any live cell with more than three live neighbours dies (overpopulation).
% 4. Any dead cell with exactly three live neighbours becomes a live cell (reproduction).


% Initialisation: generate random matrix of size N
N = 100;
p = 0.5; % probability of alive cells 

current_gen = zeros(N+2, N+2);  % give current_gen borders of zeros
current_gen(2:N+1, 2:N+1) = sprand(N, N, 0.5);
new_gen = (current_gen > p);

% Counting live neighbours
for i = 1:N
    current_gen = zeros(N+2, N+2);
    for r = 2:N+1;  % rows of the current_gen matrix
        for c = 2:N+1;  % columns of the current_gen matrix
            % count diagonal living neighbours
            diag = new_gen(r-1, c-1) + new_gen(r-1, c+1) + new_gen(r+1, c-1) + new_gen(r+1, c+1);
            % count the neighbours in the North, East, South and West directions
            nesw = new_gen(r-1, c) + new_gen(r+1, c) + new_gen(r, c-1) + new_gen(r, c+1);
            % total no.of live neighbours
            num_alive = diag + nesw;

            % Update cells according to the rules
            if (new_gen(r, c)== 1) && ((num_alive < 2) || (num_alive > 3))
              current_gen(r, c) = 0;
            elseif (new_gen(r, c)== 1) && ((num_alive == 2) || (num_alive == 3))
              current_gen(r, c) = 1;
            elseif (new_gen(r, c)== 0) && (num_alive == 3)
              current_gen(r, c) = 1;
            end
        end
    end
    new_gen = current_gen;
    pcolor(new_gen)
    colormap(autumn)
    title ('Game of Life','FontSize',14)
    pause(0.01)
end


% REFERENCES
% Shiri, D. (2020, May 29). Game-of-life/lifegame.m at master · D-Shiri/game-of-life.GitHub.\
%   Retrieved from https://github.com/d-shiri/game-of-life/blob/master/lifeGame.m

_________________________________________________
%% PEER REVIEW

% Code solution: output = 10/10

% All codes run smoothly, and every line contributes to the output of the game.

% Code solution: context = 9/10

% Very informative comments but are not consistently labelled throughout the codes.
% e.g. : 
% Initialisation: generate random matrix of size N
% N = 100;
% p = 0.5; % probability of alive cells 

% Perhaps if the description of N is labelled next to it such as how you've done to p, it is more cohesive and consistent.

% Code solution: figures = 10/10

% All codes are formed neatly and cohesively. The placements throughout the codes are also good.

% Creativity = 3/5

% Very similar to the ones on the references.

% Code styling = 4/5

% Mostly it is understandable and gives ease to understanding the codes.

% Ability to follow instructions = 3/5

% The instruction requests for codes that does not include too much 'for' loops however this one is using 'for' loops in two sections of the codes.
% However, good use in sprand()

% Use of GitHub = 2/5

% Only uses upload feature and edited once.

% TOTAL MARKS: 41/50
