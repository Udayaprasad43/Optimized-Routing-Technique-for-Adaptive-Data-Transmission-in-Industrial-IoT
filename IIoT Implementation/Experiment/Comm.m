power= 20;
range=30;
rate=40;

% str2num(get(handles.edit1,'String'))

% power
% range
% rate
% 
% disp('Start')
% pause
% disp('End')

while power==0 || isempty(power) || range==0 || isempty(range) || rate==0 || isempty(rate)
    error('Please enter the values correctly');
end


%axes(handles.axes5)
%clc
%cla

s = 40;
r = 100;

nodex_g=nodex;
nodey_g=nodey;
nodex_e=[];
nodey_e=[];
nodex=nodex;
nodey=nodey;
% s=handles.edit1;
% r=handles.edit2;

H1=H1;
H2=H2;
H3=H3;
H4=H4;
H5=H5;
H6=H6;
H7=H7;
H8=H8;
H9=H9;
g1=g1;
g2=g2;
g3=g3;
g4=g4;
g5=g5;
g6=g6;
g7=g7;
g8=g8;
g9=g9;
nodex=nodex;
nodey=nodey;
mark=mark;

%%axes(handles.axes5)
hold on
[H1,H2,H3,H4,H5,H6,H7,H8,H9]=header_nodes(mark,g1,g2,g3,g4,g5,g6,g7,g8,g9,nodex,nodey);
joining_nodes(H1,H2,H3,H4,H5,H6,H7,H8,H9,g1,g2,g3,g4,g5,g6,g7,g8,g9,nodex,nodey,mark);
joining_heads(H1,H2,H3,H4,H5,H6,H7,H8,H9,g1,g2,g3,g4,g5,g6,g7,g8,g9,nodex,nodey,mark)
for i=1:size(nodex,2) 
    plot(nodex(i),nodey(i),'b*')
    text(nodex(i)+0.05,nodey(i),[num2str(i)])
end
[ROUTE_NODES,DE_NODES,faultcount,tym,FIT]=sender_to_receiver2(nodex_g,nodey_g,nodex_e,nodey_e,nodex,nodey,s,r);


%%set(handles.pushbutton2,'Enable','on') 

%%guidata(hObject, handles);
