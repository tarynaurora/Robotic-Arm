function plotInverseKinematics(p_start, p_end, timp_animatie, f)
   
    try
        [~, ~, ~] = InverseKinematics(p_start);  
        [~, ~, ~] = InverseKinematics(p_end);  
    catch ME
        disp(ME.message);
        return;  
    end
    
   
    t = linspace(0, timp_animatie, 100);  
    % Interpolare pentru poziții între valorile de start și sfârșit
    p = zeros(3, length(t));  % 3 coordonate: x, y, z
    for i = 1:length(t)
        % Interpolare liniară între p_start și p_end
        p(:, i) = (1 - t(i)/t(end)) * p_start + (t(i)/t(end)) * p_end;
    end

    % Inițializare variabile pentru a păstra datele
    l = zeros(3, length(t)); % Include z = 0 pentru toate punctele

    if f == 1
        figure
        hold on
        grid on

        % Generare date pentru animație
        for i = 1:length(t)
            cla
            % Folosim funcția de cinematica inversă pentru a calcula unghiurile și lungimea cuplei
            [theta1, theta2, d] = InverseKinematics(p(:, i));  % Calculăm unghiurile și translatarea pentru poziția curentă
            
            % Folosim funcția geometrică pentru a calcula poziția pe baza unghiurilor și lungimii cuplei
            [pos, arm1, arm2, arm3] = EndEffectorPosition(theta1, theta2, d);  % Folosește unghiurile și translatarea calculate
            plotSystem(arm1, arm2, arm3, 0);
            view(30, 10);
            
            % Extragem coordonatele x, y, z
            l(:, i) = pos;  % Folosim [x; y; z]
            
            % Desenăm traiectoria în 3D
            plot3(l(1,:), l(2,:), l(3,:), 'LineStyle', '-.')
            pause(0.01)
            xlabel 'x'
            ylabel 'y'
            zlabel 'z'
            axis([-5, 5, -5, 5, -5, 5])  % Ajustează limitele axelor după nevoie
        end

        % Desenăm traiectoria finală
        plot3(l(1,:), l(2,:), l(3,:), 'LineStyle', '-.' );
    end
end
