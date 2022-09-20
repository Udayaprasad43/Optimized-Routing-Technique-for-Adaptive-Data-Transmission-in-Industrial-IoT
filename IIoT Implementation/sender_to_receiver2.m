function [ROUTE_NODES,DE_NODES,faultcount,tym,FIT]=sender_to_receiver2(nodex_g,nodey_g,nodex_e,nodey_e,nodex,nodey,s,r)

rad=2; % range of the node
FIT=0;
sender=[nodex(s) nodey(s)]; % sender coordinates
circle(sender(1),sender(2),rad); % draw a circle to show range of sender
receiver=[nodex(r) nodey(r)]; % receiver coordinates

faultcount=0; % total number of faults encountered in the route
tym=[]; % total time taken in the route

ROUTE_NODES=[];
DE_NODES={};
int=0;

while(1)
    t1=clock;
    int=int+1;
    % finding nodes which are in range to the sender nodes
    dist_mat=[]; % distances of senders with nodes in its range
    ind=[]; % indexes of ranged nodes wrt sender
    for i=1:size(nodex,2) 
        coor2=[nodex(i) nodey(i)];
        dist=distanceformula(sender,coor2); % calculate distance between sender and all other nodes
        if dist<rad % select only the nodes in range
            dist_mat=[dist_mat; dist];
            ind=[ind i];
        end
    end
    link=[];
    % link matrix    
    for i=1:length(ind)
        for j=1:length(ind)
            link(i,j)=round(rand);
        end
    end
    
    % applying DE to the link matrix
%     [ind,M]=de(link,ind);
    
    % finding the closest node to the receiver, out of the selected ranged nodes
    for i=1:length(ind)
        node1=[nodex(ind(i)) nodey(ind(i))];
        dist(i)=distanceformula(node1,receiver); % distance of the ranged nodes to receiver            
    end
    [sortdist,I]=sort(dist); % arranging the indexes 

    % finding the next node to hop on      
    for i=1:length(I)
        flag=0;
        nnv=ind(I(i)); % next node value
        nextnode=[nodex(nnv) nodey(nnv)];
        for j=1:length(nodex_e)
            if nextnode(1)==nodex_e(j) && nextnode(2)==nodey_e(j)
%                 t1=clock;
                blink_line(sender,nextnode)                
                ROUTE_NODES=[ROUTE_NODES; sender  nextnode];
                faultcount=faultcount+1;
                flag=1;
%                 t2=clock;
%                 tym=tym+etime(t2,t1);
                break;
            end
        end
%         flag
        if flag==1
            continue;
        elseif flag==0
            break;
        end
    end
    
    draw_line2(sender,nextnode)
    circle(nextnode(1),nextnode(2),rad);
%     FIT(int)=M;
    ROUTE_NODES=[ROUTE_NODES; sender  nextnode];
    
    % if destination is reached, break the loop
    if nextnode(1)==receiver(1) && nextnode(2)==receiver(2)       
        break;   
    end
       
    sender=nextnode;    
    
    pause(0.5)
    t2=clock;
    tym=[tym etime(t2,t1)];
end
