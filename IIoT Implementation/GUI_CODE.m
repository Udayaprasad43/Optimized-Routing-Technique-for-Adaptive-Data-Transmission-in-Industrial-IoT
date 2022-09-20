function varargout = GUI_CODE(varargin)
% GUI_CODE MATLAB code for GUI_CODE.fig
%      GUI_CODE, by itself, creates a new GUI_CODE or raises the existing
%      singleton*.
%
%      H = GUI_CODE returns the handle to a new GUI_CODE or the handle to
%      the existing singleton*.
%
%      GUI_CODE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_CODE.M with the given input arguments.
%
%      GUI_CODE('Property','Value',...) creates a new GUI_CODE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_CODE_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_CODE_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_CODE

% Last Modified by GUIDE v2.5 29-Jun-2019 09:37:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_CODE_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_CODE_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before GUI_CODE is made visible.
function GUI_CODE_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_CODE (see VARARGIN)

set(handles.pushbutton1,'Enable','off') 
set(handles.pushbutton2,'Enable','off') 
set(handles.pushbutton3,'Enable','off') 
set(handles.pushbutton5,'Enable','off') 
set(handles.pushbutton6,'Enable','off') 

% handles.power=rand;
% handles.range=rand;
% handles.rate=rand;

% set(handles.edit3,'String',(handles.power));
% set(handles.edit4,'String',(handles.range));
% set(handles.edit5,'String',(handles.rate));

% handles.edit3=handles.power;
% handles.edit4=handles.range;
% handles.edit5=handles.rate;


axes(handles.axes1)
clc
cla
x=[0 20 40];
ax = gca;
set(gca,'XTick',x)
ax.XAxis.TickLabel = {' ',' ',' '};
pause(0.5)
y=[0 20 40];
ay = gca;
set(gca,'XTick',y)
ay.YAxis.TickLabel = {' ',' ',' '};
% pause(0.5)

axes(handles.axes2)
clc
cla
x=[0 20 40];
ax = gca;
set(gca,'XTick',x)
ax.XAxis.TickLabel = {' ',' ',' '};
pause(0.5)
y=[0 20 40];
ay = gca;
set(gca,'XTick',y)
ay.YAxis.TickLabel = {' ',' ',' '};
% pause(0.5)

axes(handles.axes3)
clc
cla
x=[0 20 40];
ax = gca;
set(gca,'XTick',x)
ax.XAxis.TickLabel = {' ',' ',' '};
pause(0.5)
y=[0 20 40];
ay = gca;
set(gca,'XTick',y)
ay.YAxis.TickLabel = {' ',' ',' '};
% pause(0.5)

axes(handles.axes4)
clc
cla
x=[0 20 40];
ax = gca;
set(gca,'XTick',x)
ax.XAxis.TickLabel = {' ',' ',' '};
pause(0.5)
y=[0 20 40];
ay = gca;
set(gca,'XTick',y)
ay.YAxis.TickLabel = {' ',' ',' '};
% pause(0.5)

axes(handles.axes5)
clc
cla
x=[0 20 40];
ax = gca;
set(gca,'XTick',x)
ax.XAxis.TickLabel = {' ',' ',' '};
pause(0.5)
y=[0 20 40];
ay = gca;
set(gca,'XTick',y)
ay.YAxis.TickLabel = {' ',' ',' '};
% pause(0.5)

set(handles.pushbutton3,'Enable','on') 

% Choose default command line output for GUI_CODE
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_CODE wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_CODE_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


power=str2num(get(handles.edit4,'String'));
range=str2num(get(handles.edit3,'String'));
rate=str2num(get(handles.edit5,'String'));

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


axes(handles.axes5)
clc
cla

s = str2num((get(handles.edit1,'String')));
r = str2num((get(handles.edit2,'String')));

nodex_g=handles.nodex;
nodey_g=handles.nodey;
nodex_e=[];
nodey_e=[];
nodex=handles.nodex;
nodey=handles.nodey;
% s=handles.edit1;
% r=handles.edit2;

H1=handles.H1;
H2=handles.H2;
H3=handles.H3;
H4=handles.H4;
H5=handles.H5;
H6=handles.H6;
H7=handles.H7;
H8=handles.H8;
H9=handles.H9;
g1=handles.g1;
g2=handles.g2;
g3=handles.g3;
g4=handles.g4;
g5=handles.g5;
g6=handles.g6;
g7=handles.g7;
g8=handles.g8;
g9=handles.g9;
nodex=handles.nodex;
nodey=handles.nodey;
mark=handles.mark;

axes(handles.axes5)
hold on
[H1,H2,H3,H4,H5,H6,H7,H8,H9]=header_nodes(mark,g1,g2,g3,g4,g5,g6,g7,g8,g9,nodex,nodey);
joining_nodes(H1,H2,H3,H4,H5,H6,H7,H8,H9,g1,g2,g3,g4,g5,g6,g7,g8,g9,nodex,nodey,mark);
joining_heads(H1,H2,H3,H4,H5,H6,H7,H8,H9,g1,g2,g3,g4,g5,g6,g7,g8,g9,nodex,nodey,mark)
for i=1:size(nodex,2)
    plot(nodex(i),nodey(i),'b*')
    text(nodex(i)+0.05,nodey(i),[num2str(i)])
end
[ROUTE_NODES,DE_NODES,faultcount,tym,FIT]=sender_to_receiver2(nodex_g,nodey_g,nodex_e,nodey_e,nodex,nodey,s,r);


set(handles.pushbutton2,'Enable','on') 

guidata(hObject, handles);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

axes(handles.axes5)
clc
cla

s = str2num((get(handles.edit1,'String')));
r = str2num((get(handles.edit2,'String')));

nodex_g=handles.nodex;
nodey_g=handles.nodey;
nodex_e=[];
nodey_e=[];
nodex=handles.nodex;
nodey=handles.nodey;
% s=handles.edit1;
% r=handles.edit2;

H1=handles.H1;
H2=handles.H2;
H3=handles.H3;
H4=handles.H4;
H5=handles.H5;
H6=handles.H6;
H7=handles.H7;
H8=handles.H8;
H9=handles.H9;
g1=handles.g1;
g2=handles.g2;
g3=handles.g3;
g4=handles.g4;
g5=handles.g5;
g6=handles.g6;
g7=handles.g7;
g8=handles.g8;
g9=handles.g9;
nodex=handles.nodex;
nodey=handles.nodey;
mark=handles.mark;

axes(handles.axes5)
hold on
[H1,H2,H3,H4,H5,H6,H7,H8,H9]=header_nodes(mark,g1,g2,g3,g4,g5,g6,g7,g8,g9,nodex,nodey);
joining_nodes(H1,H2,H3,H4,H5,H6,H7,H8,H9,g1,g2,g3,g4,g5,g6,g7,g8,g9,nodex,nodey,mark);
joining_heads(H1,H2,H3,H4,H5,H6,H7,H8,H9,g1,g2,g3,g4,g5,g6,g7,g8,g9,nodex,nodey,mark)
for i=1:size(nodex,2)
    plot(nodex(i),nodey(i),'b*')
    text(nodex(i)+0.05,nodey(i),[num2str(i)])
end
comm2(H1,H2,H3,H4,H5,H6,H7,H8,H9,g1,g2,g3,g4,g5,g6,g7,g8,g9,nodex,nodey,mark,s,r)


set(handles.pushbutton5,'Enable','on') 


guidata(hObject, handles);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

node=100;

% deloy nodes and divide area into grids
axes(handles.axes1)
clc
cla
[nodex,nodey,mark,g1,g2,g3,g4,g5,g6,g7,g8,g9]=deploy_nodes(node);
pause(0.5)

% marking header nodes in every grid
axes(handles.axes2)
clc
cla
[H1,H2,H3,H4,H5,H6,H7,H8,H9]=header_nodes(mark,g1,g2,g3,g4,g5,g6,g7,g8,g9,nodex,nodey);
pause(0.5)

% joining all headers with their zonal nodes
axes(handles.axes3)
clc
cla
joining_nodes(H1,H2,H3,H4,H5,H6,H7,H8,H9,g1,g2,g3,g4,g5,g6,g7,g8,g9,nodex,nodey,mark)
pause(0.5)

% join all headers to complete the network
axes(handles.axes4)
clc
cla
joining_heads(H1,H2,H3,H4,H5,H6,H7,H8,H9,g1,g2,g3,g4,g5,g6,g7,g8,g9,nodex,nodey,mark)
pause(0.5)


axes(handles.axes5)
clc
cla


handles.H1=H1;
handles.H2=H2;
handles.H3=H3;
handles.H4=H4;
handles.H5=H5;
handles.H6=H6;
handles.H7=H7;
handles.H8=H8;
handles.H9=H9;
handles.g1=g1;
handles.g2=g2;
handles.g3=g3;
handles.g4=g4;
handles.g5=g5;
handles.g6=g6;
handles.g7=g7;
handles.g8=g8;
handles.g9=g9;
handles.nodex=nodex;
handles.nodey=nodey;
handles.mark=mark;

set(handles.pushbutton1,'Enable','on') 


[I,J,R,x_heads,y_heads,beta,gamma,TR_CN,TR_CC,alpha,d,l,TR,P,H,E,W,f_t,T_p,Pr,R_max]=eqs(nodex,nodey,H1,H2,H3,H4,H5,H6,H7,H8,H9);

guidata(hObject, handles);



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

res;

guidata(hObject, handles);


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.edit1,'Enable','off') 
set(handles.edit2,'Enable','off') 

axes(handles.axes5)
clc
cla

% s = str2num((get(handles.edit1,'String')));
% r = str2num((get(handles.edit2,'String')));

nodex_g=handles.nodex;
nodey_g=handles.nodey;
nodex_e=[];
nodey_e=[];
nodex=handles.nodex;
nodey=handles.nodey;
% s=handles.edit1;
% r=handles.edit2;

H1=handles.H1;
H2=handles.H2;
H3=handles.H3;
H4=handles.H4;
H5=handles.H5;
H6=handles.H6;
H7=handles.H7;
H8=handles.H8;
H9=handles.H9;
g1=handles.g1;
g2=handles.g2;
g3=handles.g3;
g4=handles.g4;
g5=handles.g5;
g6=handles.g6;
g7=handles.g7;
g8=handles.g8;
g9=handles.g9;
nodex=handles.nodex;
nodey=handles.nodey;
mark=handles.mark;

axes(handles.axes5)
hold on
[H1,H2,H3,H4,H5,H6,H7,H8,H9]=header_nodes(mark,g1,g2,g3,g4,g5,g6,g7,g8,g9,nodex,nodey);
joining_nodes(H1,H2,H3,H4,H5,H6,H7,H8,H9,g1,g2,g3,g4,g5,g6,g7,g8,g9,nodex,nodey,mark);
joining_heads(H1,H2,H3,H4,H5,H6,H7,H8,H9,g1,g2,g3,g4,g5,g6,g7,g8,g9,nodex,nodey,mark)
for i=1:size(nodex,2)
    plot(nodex(i),nodey(i),'b*')
    text(nodex(i)+0.05,nodey(i),[num2str(i)])
end

% pso(handles);
pso2(handles);

set(handles.pushbutton6,'Enable','on') 

guidata(hObject, handles);
