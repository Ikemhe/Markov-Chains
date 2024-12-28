clc
clear
close all

%This code explores the concepts of Markov Chains

% Take input for the size of the stochastic matrix
n = input('Enter the size of the stochastic matrix (n): ');

% Initialize the stochastic matrix
P = zeros(n);

% Take input for the elements of the stochastic matrix
disp('Enter the elements of the stochastic matrix:');
for i = 1:n
    for j = 1:n
        P(i, j) = input(sprintf('P(%d, %d): ', i, j));
    end
end

% Take input for the size of the probability vector
m = input('Enter the size of the probability vector (m): ');

% Initialize the probability vector
pi0 = zeros(1, m);

% Take input for the elements of the probability vector
disp('Enter the elements of the probability vector:');
for i = 1:m
    pi0(i) = input(sprintf('pi0(%d): ', i));
end

% Check if the sum of elements in the probability vector is 1
if abs(sum(pi0) - 1) > eps
    disp('Error: The sum of elements in the probability vector must be 1.');
    return;
end

% Perform the Markov chain simulation
num_steps = input('Enter the number of steps for simulation: ');

fprintf('\nSimulation Results:\n');

% Initialize the current state
current_state = find(rand < cumsum(pi0), 1);

% Display the initial state
fprintf('Step 1: State %d\n', current_state);

% Perform the simulation
for step = 2:num_steps
    % Generate the next state based on the transition probabilities
    next_state = find(rand < cumsum(P(current_state, :)), 1);
    
    % Update the current state
    current_state = next_state;
    
    % Display the current state
    fprintf('Step %d: State %d\n', step, current_state);
end