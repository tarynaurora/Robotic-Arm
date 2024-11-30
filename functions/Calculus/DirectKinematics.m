

function [V] = DirectKinematics(Q,dQ,timp,f)

n = length(Q(1,:));
V = zeros(6,n);

for i=1:n
    q1=Q(1,i);
    q2=Q(2,i);
    q3=Q(3,i);
    
    dq1=dQ(1,i);
    dq2=dQ(2,i);
    dq3=dQ(3,i);
    
    J=[
                            0                                -2 * sin(q2)                0    ;...
        2 * sin(q2) * cos(q1) - q3 * sin(q1) - 2 * cos(q1)    2 * sin(q1) * cos(q2)    cos(q1);...
        q3 * cos(q1) - 2 * sin(q1) + 2 * sin(q1) * sin(q2)   -2 * cos(q1) * cos(q2)    sin(q1);...
                            1                                      0                     0    ;...
                            0                                     cos(q1)                0    ;...
                            0                                     sin(q1)                0    ;
      ];
    V(:,i)=J*[dq1;dq2;dq3];
end
 if f==1
     figure
     hold
     grid
     plot(timp,V(1,:),'Color','k')
     plot(timp,V(2,:),'Color','b')
     plot(timp,V(3,:),'Color','r')
     
     xlabel 'timp'
     ylabel 'v liniare'
     
     figure
     hold
     grid
     plot(timp,V(4,:),'Color','k')
     plot(timp,V(5,:),'Color','b')
     plot(timp,V(6,:),'Color','r')
     
     xlabel 'timp'
     ylabel 'v unghiulare'
 else
 end

end