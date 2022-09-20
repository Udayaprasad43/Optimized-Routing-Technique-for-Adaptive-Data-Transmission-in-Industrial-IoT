function [rx,ry]=rx_node(rand_zone)

high=10; % higher bound to a coordinate value
low=0; % lower bound to a coordinate value
mark=[0 3.3 6.6 10]; % points on the area where grid is marked

nodex=low+(high-low).*rand(1,1); % generate a random x coordinate
nodey=low+(high-low).*rand(1,1); % generate a randon y coordinate
i=1;

% for i=1:node % x and y coordinates for good sensor nodes
 while(1)
%     disp('in while loop')
    nodex=low+(high-low).*rand(1,1); % generate a random x coordinate
    nodey=low+(high-low).*rand(1,1); % generate a random y coordinate

    if nodex(i)>mark(1) && nodex(i)<mark(2) && nodey(i)>mark(1) && nodey(i)<mark(2)% check if the randomly coordinates generated for the sink are in zone 1
        if rand_zone==1
%             disp('1')
            rx=nodex;
            ry=nodey;
            break;
        end
    end
    if nodex(i)>mark(2) && nodex(i)<mark(3) && nodey(i)>mark(1) && nodey(i)<mark(2)% check if the randomly coordinates generated for the sink are in zone 2
        if rand_zone==2
%             disp('2')
            rx=nodex;
            ry=nodey;
            break;
        end
    end
    if nodex(i)>mark(3) && nodex(i)<mark(4) && nodey(i)>mark(1) && nodey(i)<mark(2)% check if the randomly coordinates generated for the sink are in zone 3
        if rand_zone==3
%             disp('3')
            rx=nodex;
            ry=nodey;
            break;
        end
    end
    
    if nodex(i)>mark(1) && nodex(i)<mark(2) && nodey(i)>mark(2) && nodey(i)<mark(3)% check if the randomly coordinates generated for the sink are in zone 4
        if rand_zone==4
%             disp('4')
            rx=nodex;
            ry=nodey;
            break;
        end
    end
    if nodex(i)>mark(2) && nodex(i)<mark(3) && nodey(i)>mark(2) && nodey(i)<mark(3)% check if the randomly coordinates generated for the sink are in zone 5
        if rand_zone==5
%             disp('5')
            rx=nodex;
            ry=nodey;
            break;
        end
    end
    if nodex(i)>mark(3) && nodex(i)<mark(4) && nodey(i)>mark(2) && nodey(i)<mark(3)% check if the randomly coordinates generated for the sink are in zone 6
        if rand_zone==6
%             disp('6')
            rx=nodex;
            ry=nodey;
            break;
        end
    end
    
    if nodex(i)>mark(1) && nodex(i)<mark(2) && nodey(i)>mark(3) && nodey(i)<mark(4)% check if the randomly coordinates generated for the sink are in zone 7
        if rand_zone==7
%             disp('7')
            rx=nodex;
            ry=nodey;
            break;
        end
    end
    if nodex(i)>mark(2) && nodex(i)<mark(3) && nodey(i)>mark(3) && nodey(i)<mark(4)% check if the randomly coordinates generated for the sink are in zone 8
        if rand_zone==8
%             disp('8')
            rx=nodex;
            ry=nodey;
            break;
        end
    end
    if nodex(i)>mark(3) && nodex(i)<mark(4) && nodey(i)>mark(3) && nodey(i)<mark(4)% check if the randomly coordinates generated for the sink are in zone 9
        if rand_zone==9
%             disp('9')
            rx=nodex;
            ry=nodey;
            break;
        end
    end
 end

end