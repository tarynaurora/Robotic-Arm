
function [theta1, theta2, d] = InverseKinematics(p)
    % Parametrii brațului robotic (în 3D)
    l1 = 2;  % Lungimea primului segment (rigid)
    l2 = 2;  % Lungimea celui de-al doilea segment (rigid)
    
    % Coordonatele punctului efectorului (relative la baza brațului)
    x = p(1);
    y = p(2);
    z = p(3);
    
    % Calculăm distanța de la baza brațului la punctul dorit
    r = sqrt(x^2 + y^2);  % Proiecția în planul X-Y
    dist = sqrt(r^2 + z^2);  % Distanța totală 3D
    
    % Verificăm dacă punctul este accesibil
    if dist > (l1 + l2)
        error('Punctul este inaccesibil, distanța depășește limita brațului!');
    end

    % Calculăm unghiul pentru primul segment (rigid) theta1
    theta1 = atan2(y, x);
    
    % Calculăm unghiul pentru al doilea segment (rigid) theta2
    cos_theta2 = (dist^2 - l1^2 - l2^2) / (2 * l1 * l2);
    if abs(cos_theta2) > 1  % Verificăm dacă soluția este validă
        error('Unghiul theta2 este imposibil, verifică poziția punctului!');
    end
    theta2 = acos(cos_theta2);
    
    % Calculăm translatarea prismatică (d)
    d = z - l1 * sin(theta1) - l2 * sin(theta2);  % Posibilă ajustare a cuplei prismatică
    
    % Conversia unghiurilor în grade pentru a fi folosite în aplicații
    theta1 = rad2deg(theta1);
    theta2 = rad2deg(theta2);
end
