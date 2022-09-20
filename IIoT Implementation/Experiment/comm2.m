function comm2(H1,H2,H3,H4,H5,H6,H7,H8,H9,g1,g2,g3,g4,g5,g6,g7,g8,g9,nodex,nodey,mark,s,r)

rad=5;

sx=nodex(s);sy=nodey(s);

dist_S_H1=distanceformula(H1,[sx sy]);
dist_S_H2=distanceformula(H2,[sx sy]);
dist_S_H3=distanceformula(H3,[sx sy]);
dist_S_H4=distanceformula(H4,[sx sy]);
dist_S_H5=distanceformula(H5,[sx sy]);
dist_S_H6=distanceformula(H6,[sx sy]);
dist_S_H7=distanceformula(H7,[sx sy]);
dist_S_H8=distanceformula(H8,[sx sy]);
dist_S_H9=distanceformula(H9,[sx sy]);

rx=nodex(r);ry=nodey(r);

dist_R_H1=distanceformula(H1,[rx ry]);
dist_R_H2=distanceformula(H2,[rx ry]);
dist_R_H3=distanceformula(H3,[rx ry]);
dist_R_H4=distanceformula(H4,[rx ry]);
dist_R_H5=distanceformula(H5,[rx ry]);
dist_R_H6=distanceformula(H6,[rx ry]);
dist_R_H7=distanceformula(H7,[rx ry]);
dist_R_H8=distanceformula(H8,[rx ry]);
dist_R_H9=distanceformula(H9,[rx ry]);

[min_S,IS]=min([dist_S_H1 dist_S_H2 dist_S_H3 dist_S_H4 dist_S_H5 dist_S_H6 dist_S_H7 dist_S_H8 dist_S_H9]);
[min_R,IR]=min([dist_R_H1 dist_R_H2 dist_R_H3 dist_R_H4 dist_R_H5 dist_R_H6 dist_R_H7 dist_R_H8 dist_R_H9]);

if IS==1
    sender=H1;
    draw_line2([sx sy],sender)
elseif  IS==2
    sender=H2;
    draw_line2([sx sy],sender)
elseif  IS==3
    sender=H3;
    draw_line2([sx sy],sender)
elseif  IS==4
    sender=H4;
    draw_line2([sx sy],sender)
elseif  IS==5
    sender=H5;
    draw_line2([sx sy],sender)
elseif  IS==6
    sender=H6;
    draw_line2([sx sy],sender)
elseif  IS==7
    sender=H7;
    draw_line2([sx sy],sender)
elseif  IS==8
    sender=H8;
    draw_line2([sx sy],sender)
elseif  IS==9
    sender=H9;
    draw_line2([sx sy],sender)
end
    
if IR==1
    receiver=H1;
elseif  IR==2
    receiver=H2;
elseif  IR==3
    receiver=H3;
elseif  IR==4
    receiver=H4;
elseif  IR==5
    receiver=H5;
elseif  IR==6
    receiver=H6;
elseif  IR==7
    receiver=H7;
elseif  IR==8
    receiver=H8;
elseif  IR==9
    receiver=H9;
end

zone_nodex=[H1(1) H2(1) H3(1) H4(1) H5(1) H6(1) H7(1) H8(1) H9(1)];
zone_nodey=[H1(2) H2(2) H3(2) H4(2) H5(2) H6(2) H7(2) H8(2) H9(2)];
nodex=zone_nodex;
nodey=zone_nodey;

faultcount=0; % total number of faults encountered in the route
tym=[]; % total time taken in the route
ROUTE_NODES=[];
DE_NODES={};
FIT=0;

while(1)
    t1=clock;
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
        
%         flag
        if flag==1
            continue;
        elseif flag==0
            break;
        end
    end
    
    draw_line2(sender,nextnode)
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

draw_line2(receiver,[rx ry])

end