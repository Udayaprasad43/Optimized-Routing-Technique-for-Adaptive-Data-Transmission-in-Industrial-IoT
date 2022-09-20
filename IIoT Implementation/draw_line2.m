function draw_line2(coor1,coor2)

x1=coor1(1);
x2=coor2(1);
y1=coor1(2);
y2=coor2(2);
X=linspace(x1,x2,50);
Y=linspace(y1,y2,50);

% X2=linspace(x2,x1,100);
% Y2=linspace(y2,y1,100);

% Request to send
% comet(X,Y)
% plot([coor1(1) coor2(1)],[coor1(2) coor2(2)],'b--','LineWidth',3)

% Clear to send
% comet(X2,Y2)
% plot([coor1(1) coor2(1)],[coor1(2) coor2(2)],'g--','LineWidth',3)

% Message transmission
comet(X,Y)
plot([coor1(1) coor2(1)],[coor1(2) coor2(2)],'m','LineWidth',4)

end