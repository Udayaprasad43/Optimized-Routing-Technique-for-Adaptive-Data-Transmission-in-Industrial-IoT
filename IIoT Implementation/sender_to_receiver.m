function sender_to_receiver(nodex,nodey,s,r)

rad=5; % range

sender=s; % sender coordinates
receiver=r; % receiver coordinates

while(1)
    % finding nodes which are in range to the sender nodes
    dist_mat=[]; % distances of senders with nodes in its range
    ind=[]; % indexes of ranged nodes wrt sender
    for i=1:size(nodex,2) 
        coor2=[nodex(i) nodey(i)];
        dist=distanceformula(sender,coor2); % calculate distance between sender and all other nodes
        if dist<rad % select only the nodes in range
            dist_mat=[dist_mat; dist];
            ind=[ind; i];
        end
    end

    % finding the closest node to the receiver, out of the selected ranged nodes
    for i=1:length(ind)
        node1=[nodex(ind(i)) nodey(ind(i))];
        dist(i)=distanceformula(node1,receiver); % distance of the ranged nodes to receiver            
    end
    [sortdist,I]=sort(dist); % arranging the indexes 
%     ind(I);

    % finding the next node to hop on  
    for i=1:length(I)
        flag=0;
        nnv=ind(I(i)); % next node value
        nextnode=[nodex(nnv) nodey(nnv)];           
        
        if flag==1
            continue;
        elseif flag==0
            break;
        end
    end
    blink_line(sender,nextnode)
    draw_line(sender,nextnode)
    path=[path; nextnode]; % updating the communication path
    % if destination is reached, break the loop
    if nextnode(1)==receiver(1) && nextnode(2)==receiver(2)
%         disp('we have reached the destination')         
        break;   
    end
       
    sender=nextnode;
    
    
    pause(0.5)
end

