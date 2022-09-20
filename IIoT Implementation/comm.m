function comm(H1,H2,H3,H4,H5,H6,H7,H8,H9,g1,g2,g3,g4,g5,g6,g7,g8,g9,nodex,nodey,mark,s)

high1=randi(length(mark),1,1);
high2=randi(length(mark),1,1);
low1=randi(length(mark),1,1);
low2=randi(length(mark),1,1);

joining_heads(H1,H2,H3,H4,H5,H6,H7,H8,H9,g1,g2,g3,g4,g5,g6,g7,g8,g9,nodex,nodey,mark)


rx=low1+(high1-low1).*rand(1,1);
ry=low2+(high2-low2).*rand(1,1);

R=[rx ry]

H=[H1; H2; H3; H4; H5; H6; H7; H8; H9];
for i=1:9
    coor1=R;
    coor2=H(i,:);
    dist(i)=distanceformula(coor1,coor2);
end
[C,IDX]=min(dist);
if IDX==1
    rh=H1;
elseif IDX==2
    rh=H2;
elseif IDX==3
    rh=H3;
elseif IDX==4
    rh=H4;
elseif IDX==5
    rh=H5;
elseif IDX==6
    rh=H6;
elseif IDX==7
    rh=H7;
elseif IDX==8
    rh=H8;
elseif IDX==9
    rh=H9;
end   

S=[nodex(s) nodey(s)];

% from sender to the respective zone header
H=[H1; H2; H3; H4; H5; H6; H7; H8; H9];
for i=1:9
    coor1=S;
    coor2=H(i,:);
    dist(i)=distanceformula(coor1,coor2);
end
[C,IDX]=min(dist);
if IDX==1
    sh=H1;
elseif IDX==2
    sh=H2;
elseif IDX==3
    sh=H3;
elseif IDX==4
    sh=H4;
elseif IDX==5
    sh=H5;
elseif IDX==6
    sh=H6;
elseif IDX==7
    sh=H7;
elseif IDX==8
    sh=H8;
elseif IDX==9
    sh=H9;
end    
coor1=S;
coor2=sh;
R=blink_line(coor1,coor2,low1,low2,high1,high2);
draw_line(coor1,coor2)

% from sender zone to receiver zone
s=sh
r=rh
nodex=[H1(1) H2(1) H3(1) H4(1) H5(1) H6(1) H7(1) H8(1) H9(1) ];
nodey=[H1(2) H2(2) H3(2) H4(2) H5(2) H6(2) H7(2) H8(2) H9(2) ];
sender_to_receiver(nodex,nodey,s,r);

% from receiver zone header to receiver node