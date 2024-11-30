
function trajectoryPlanner(q, T, n)
    
    timp = linspace(0, T, n);
    
    % Calcularea traiectoriei în funcție de tipul de polinom
    [cubic_Q, cubic_dQ, cubic_ddQ] = CubicTrajectory(q, T, n);
    [quintic_Q, quintic_dQ, quintic_ddQ] = QuinticTrajectory(q, T, n);
    
for i = 1:3
    figure;

    % Subplot pentru poziție
    subplot(3, 1, 1);
    plot(timp, cubic_Q(i,:), 'b', 'LineWidth', 2); % Traiectoria cubică
    hold on;
    plot(timp, quintic_Q(i,:), 'g', 'LineWidth', 2); % Traiectoria quintică
    title('Position');
    legend('Cubic', 'Quintic'); % Adaugă legendă
    hold off;

    % Subplot pentru viteză
    subplot(3, 1, 2);
    plot(timp, cubic_dQ(i,:), 'b', 'LineWidth', 2); % Viteza cubică
    hold on;
    plot(timp, quintic_dQ(i,:), 'g', 'LineWidth', 2); % Viteza quintică
    title('Velocity');
    legend('Cubic', 'Quintic'); % Adaugă legendă
    hold off;

    % Subplot pentru accelerație
    subplot(3, 1, 3);
    plot(timp, cubic_ddQ(i,:), 'b', 'LineWidth', 2); % Accelerația cubică
    hold on;
    plot(timp, quintic_ddQ(i,:), 'g', 'LineWidth', 2); % Accelerația quintică
    title('Acceleration');
    legend('Cubic', 'Quintic'); % Adaugă legendă
    hold off;
end

end