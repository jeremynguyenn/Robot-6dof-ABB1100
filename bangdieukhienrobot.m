function varargout = bangdieukhienrobot(varargin)
%BANGDIEUKHIENROBOT MATLAB code file for bangdieukhienrobot.fig
%      BANGDIEUKHIENROBOT, by itself, creates a new BANGDIEUKHIENROBOT or raises the existing
%      singleton*.
%
%      H = BANGDIEUKHIENROBOT returns the handle to a new BANGDIEUKHIENROBOT or the handle to
%      the existing singleton*.
%
%      BANGDIEUKHIENROBOT('Property','Value',...) creates a new BANGDIEUKHIENROBOT using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to bangdieukhienrobot_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      BANGDIEUKHIENROBOT('CALLBACK') and BANGDIEUKHIENROBOT('CALLBACK',hObject,...) call the
%      local function named CALLBACK in BANGDIEUKHIENROBOT.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help bangdieukhienrobot

% Last Modified by GUIDE v2.5 16-Dec-2023 03:25:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @bangdieukhienrobot_OpeningFcn, ...
                   'gui_OutputFcn',  @bangdieukhienrobot_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before bangdieukhienrobot is made visible.
function bangdieukhienrobot_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for bangdieukhienrobot
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes bangdieukhienrobot wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = bangdieukhienrobot_OutputFcn(hObject, eventdata, handles)
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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
ModelName = 'ROBOT2';
global var;
X=get(handles.slider7,'value');
set(handles.edit7,'string',num2str(X));
Y=get(handles.slider8,'value');
set(handles.edit8,'string',num2str(Y));
Z=get(handles.slider9,'value');
set(handles.edit9,'string',num2str(Z));
% khai bao bien 
a1=0;a2=225;a3=10;d1=327;d4=250;d6=64;
%X,Y,Z input 
angleZ4=0;
angleZ5=0;
angleZ6=0;
R=RPR(angleZ4,angleZ5,angleZ6);
nx=R(1,1);
ox=R(1,2);
ax=R(1,3);
ny=R(2,1);
oy=R(2,2);
ay=R(2,3);
nz=R(3,1);
oz=R(3,2);
az=R(3,3);
xW=X-(d6*(ax));
yW=Y-(d6*(ay));
zW=Z-(d6*(az));
%%theta1
theta1=atan2(yW,xW)    
  
   
%%theta2
r=sqrt(xW^2+yW^2);
O1M=r;
O1W=sqrt(r^2+(zW-327)^2);
O2W=sqrt(a3^2+d4^2);
O1O2=a2;
WM= zW-327;
alpha=(O1O2^2+O1W^2-O2W^2)/(2*O1O2*O1W);
delta=(O1W^2-WM^2+r^2)/(2*r*O1W);
O2O1W=atan2(+-sqrt(abs(1-alpha^2)),alpha);
WO1M=atan2(+-sqrt(abs(1-delta^2)),delta);
theta2=abs(O2O1W+WO1M)-pi/2
%%theta3
beta=-((-225)^2+O2W^2-O1W^2)/(2*O2W*225);
gamma=+-sqrt((1-beta^2));
X3O2W=atan2(gamma,beta);
theta3=atan2(d4,a3)-abs(X3O2W)
%%theta4
R03= [-sin(theta2 + theta3)*cos(theta1)    sin(theta1)      cos(theta2 + theta3)*cos(theta1); 
      -sin(theta2 + theta3)*sin(theta1)    -cos(theta1)     cos(theta2 + theta3)*sin(theta1); 
       cos(theta2 + theta3)                0                sin(theta2 + theta3)];
R30=inv(R03);  
R36=R30*R;
r11=R03(1,1);
r13=R36(1,3);
r12=R36(1,2);
r23=R36(2,3);
r22=R36(2,2);
r21=R36(2,1);
r33=R36(3,3);
r31=R36(3,1);
r32=R36(3,2);
theta4=atan2(r23,r12)
    
%theta5, theta6
    

theta5=atan2(+-sqrt(1-r33^2),r33)
if (theta5<-2.181661565),(theta5>2.181661565)
    theta5=abs(theta5)-pi/2
end    
theta6=atan2(-r32,r31) 
  


theta11=theta1*180/pi;
theta22=theta2*180/pi;
theta33=theta3*180/pi;
theta44=theta4*180/pi;
theta55=theta5*180/pi;
theta66=theta6*180/pi;
    
guidata(hObject,handles);
    
set_param([ModelName '/Slider Gain'],'Gain',num2str(theta11));
set_param([ModelName '/Slider Gain1'],'Gain',num2str(theta22));
set_param([ModelName '/Slider Gain2'],'Gain',num2str(theta33));
set_param([ModelName '/Slider Gain3'],'Gain',num2str(theta44));
set_param([ModelName '/Slider Gain4'],'Gain',num2str(theta55));
set_param([ModelName '/Slider Gain5'],'Gain',num2str(theta66));
    
set(handles.edit27,'string',num2str(theta11));
set(handles.edit28,'string',num2str(theta22));
set(handles.edit29,'string',num2str(theta33));
set(handles.edit30,'string',num2str(theta44));
set(handles.edit31,'string',num2str(theta55));
set(handles.edit32,'string',num2str(theta66));



% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% không gian làm vi?c
%khai báo bi?n 
l1=327;
l2=225;
l3=10;
l4=250;
l6=64;

for t1=1.2777777778*pi:0.5:-1.2777777778*pi
    for t2=0.62777777778*pi:0.5:-0.63888888889*pi
        for t3=0.30555555556*pi:0.5:-1.1388888889*pi
            for t4=1.2777777778*pi:0.5:-1.2777777778*pi
                for t5=0.66666666667*pi:0.5:-0.69444444444*pi
                    for t6=2.2222222222*pi:0.5:-2.2222222222*pi
                        px=l4*cos(t1)*cos(t2)*cos(t3) - l2*cos(t1)*sin(t2) - l3*cos(t1)*cos(t2)*sin(t3) - l3*cos(t1)*cos(t3)*sin(t2) - l4*cos(t1)*sin(t2)*sin(t3) + l6*sin(t1)*sin(t4)*sin(t5) + l6*cos(t1)*cos(t2)*cos(t3)*cos(t5) - l6*cos(t1)*cos(t5)*sin(t2)*sin(t3) - l6*cos(t1)*cos(t2)*cos(t4)*sin(t3)*sin(t5) - l6*cos(t1)*cos(t3)*cos(t4)*sin(t2)*sin(t5);
                        py=l4*cos(t2)*cos(t3)*sin(t1) - l2*sin(t1)*sin(t2) - l3*cos(t2)*sin(t1)*sin(t3) - l3*cos(t3)*sin(t1)*sin(t2) - l6*cos(t1)*sin(t4)*sin(t5) - l4*sin(t1)*sin(t2)*sin(t3) + l6*cos(t2)*cos(t3)*cos(t5)*sin(t1) - l6*cos(t5)*sin(t1)*sin(t2)*sin(t3) - l6*cos(t2)*cos(t4)*sin(t1)*sin(t3)*sin(t5) - l6*cos(t3)*cos(t4)*sin(t1)*sin(t2)*sin(t5);
                        pz=l1 + l2*cos(t2) + l3*cos(t2)*cos(t3) + l4*cos(t2)*sin(t3) + l4*cos(t3)*sin(t2) - l3*sin(t2)*sin(t3) + l6*cos(t2)*cos(t5)*sin(t3) + l6*cos(t3)*cos(t5)*sin(t2) + l6*cos(t2)*cos(t3)*cos(t4)*sin(t5) - l6*cos(t4)*sin(t2)*sin(t3)*sin(t5);
                        plot(px,py,pz,'*')
                        hold on
                    end
                end
            end
        end
    end
end   
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
ModelName = 'ROBOT2';
% khai bao bien 
l1=327;
l2=225;
l3=10;
l4=250;
l6=64;


theta1=get(handles.slider3,'value');
set(handles.edit2,'string',num2str(theta1));
theta2=get(handles.slider5,'value');
set(handles.edit3,'string',num2str(theta2));
theta3=get(handles.slider13,'value');
set(handles.edit33,'string',num2str(theta3));
theta4=get(handles.slider4,'value');
set(handles.edit5,'string',num2str(theta4));
theta5=get(handles.slider6,'value');
set(handles.edit6,'string',num2str(theta5));
theta6=get(handles.slider14,'value');
set(handles.edit34,'string',num2str(theta6));


%get the angle
set_param([ModelName '/Slider Gain'],'Gain',num2str(theta1));
set_param([ModelName '/Slider Gain1'],'Gain',num2str(theta2));
set_param([ModelName '/Slider Gain2'],'Gain',num2str(theta3));
set_param([ModelName '/Slider Gain3'],'Gain',num2str(theta4));
set_param([ModelName '/Slider Gain4'],'Gain',num2str(theta5));
set_param([ModelName '/Slider Gain5'],'Gain',num2str(theta6));

T1 = [  cosd(theta1)  0      sind(theta1)   0;
        sind(theta1)  0      -cosd(theta1)  0;
        0        1      0         l1;
        0        0      0         1];
 
 
T2 = [-sind(theta2)         -cosd(theta2)    0    -l2*sind(theta2);
     cosd(theta2)          -sind(theta2)    0      l2*cosd(theta2);
      0                0           1    0;
      0                0           0    1];
 
 
T3 = [ cosd(theta3)     0    sind(theta3)     l3*cosd(theta3);
       sind(theta3)     0    -cosd(theta3)    l3*sind(theta3);
       0           1    0           0;
       0           0    0           1];
 
 
T4 = [ cosd(theta4)   0     -sind(theta4)  0;
       sind(theta4)   0      cosd(theta4)  0;
       0        -1      0        l4;
       0         0      0        1];
 
T5 = [ cosd(theta5)   0        sind(theta5)   0;
       sind(theta5)   0        -cosd(theta5)  0;
       0         1        0         0;
       0         0        0         1];
 
 
T6 = [ cosd(theta6)     -sind(theta6)   0   0;
       sind(theta6)      cosd(theta6)   0   0;
       0            0         1   l6;
       0            0         0   1];
 
T = T1*T2*T3*T4*T5*T6;

px = T(1,4);
py = T(2,4);
pz = T(3,4);
r11 = T(1,1);
r12 = T(1,2);
r13 = T(1,3);
r21 = T(2,1);
r22 = T(2,2);
r23 = T(2,3);
r31 = T(3,1);
r32 = T(3,2);
r33 = T(3,3);
set(handles.edit47,'string',num2str(px));
set(handles.edit48,'string',num2str(py));
set(handles.edit49,'string',num2str(pz));
set(handles.edit35,'string',num2str(r11));
set(handles.edit39,'string',num2str(r12));
set(handles.edit43,'string',num2str(r13));
set(handles.edit36,'string',num2str(r21));
set(handles.edit40,'string',num2str(r22));
set(handles.edit44,'string',num2str(r23));
set(handles.edit37,'string',num2str(r31));
set(handles.edit41,'string',num2str(r32));
set(handles.edit45,'string',num2str(r33));




% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
ModelName = 'ROBOT2';
% khai bao bien 
l1=327;
l2=225;
l3=10;
l4=250;
l6=64;


theta1=get(handles.slider3,'value');
set(handles.edit2,'string',num2str(theta1));
theta2=get(handles.slider5,'value');
set(handles.edit3,'string',num2str(theta2));
theta3=get(handles.slider13,'value');
set(handles.edit33,'string',num2str(theta3));
theta4=get(handles.slider4,'value');
set(handles.edit5,'string',num2str(theta4));
theta5=get(handles.slider6,'value');
set(handles.edit6,'string',num2str(theta5));
theta6=get(handles.slider14,'value');
set(handles.edit34,'string',num2str(theta6));


%get the angle
set_param([ModelName '/Slider Gain'],'Gain',num2str(theta1));
set_param([ModelName '/Slider Gain1'],'Gain',num2str(theta2));
set_param([ModelName '/Slider Gain2'],'Gain',num2str(theta3));
set_param([ModelName '/Slider Gain3'],'Gain',num2str(theta4));
set_param([ModelName '/Slider Gain4'],'Gain',num2str(theta5));
set_param([ModelName '/Slider Gain5'],'Gain',num2str(theta6));

T1 = [  cosd(theta1)  0      sind(theta1)   0;
        sind(theta1)  0      -cosd(theta1)  0;
        0        1      0         l1;
        0        0      0         1];
 
 
T2 = [-sind(theta2)         -cosd(theta2)    0    -l2*sind(theta2);
     cosd(theta2)          -sind(theta2)    0      l2*cosd(theta2);
      0                0           1    0;
      0                0           0    1];
 
 
T3 = [ cosd(theta3)     0    sind(theta3)     l3*cosd(theta3);
       sind(theta3)     0    -cosd(theta3)    l3*sind(theta3);
       0           1    0           0;
       0           0    0           1];
 
 
T4 = [ cosd(theta4)   0     -sind(theta4)  0;
       sind(theta4)   0      cosd(theta4)  0;
       0        -1      0        l4;
       0         0      0        1];
 
T5 = [ cosd(theta5)   0        sind(theta5)   0;
       sind(theta5)   0        -cosd(theta5)  0;
       0         1        0         0;
       0         0        0         1];
 
 
T6 = [ cosd(theta6)     -sind(theta6)   0   0;
       sind(theta6)      cosd(theta6)   0   0;
       0            0         1   l6;
       0            0         0   1];
 
T = T1*T2*T3*T4*T5*T6;

px = T(1,4);
py = T(2,4);
pz = T(3,4);
r11 = T(1,1);
r12 = T(1,2);
r13 = T(1,3);
r21 = T(2,1);
r22 = T(2,2);
r23 = T(2,3);
r31 = T(3,1);
r32 = T(3,2);
r33 = T(3,3);
set(handles.edit47,'string',num2str(px));
set(handles.edit48,'string',num2str(py));
set(handles.edit49,'string',num2str(pz));
set(handles.edit35,'string',num2str(r11));
set(handles.edit39,'string',num2str(r12));
set(handles.edit43,'string',num2str(r13));
set(handles.edit36,'string',num2str(r21));
set(handles.edit40,'string',num2str(r22));
set(handles.edit44,'string',num2str(r23));
set(handles.edit37,'string',num2str(r31));
set(handles.edit41,'string',num2str(r32));
set(handles.edit45,'string',num2str(r33));


% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider5_Callback(hObject, eventdata, handles)
ModelName = 'ROBOT2';
% khai bao bien 
l1=327;
l2=225;
l3=10;
l4=250;
l6=64;


theta1=get(handles.slider3,'value');
set(handles.edit2,'string',num2str(theta1));
theta2=get(handles.slider5,'value');
set(handles.edit3,'string',num2str(theta2));
theta3=get(handles.slider13,'value');
set(handles.edit33,'string',num2str(theta3));
theta4=get(handles.slider4,'value');
set(handles.edit5,'string',num2str(theta4));
theta5=get(handles.slider6,'value');
set(handles.edit6,'string',num2str(theta5));
theta6=get(handles.slider14,'value');
set(handles.edit34,'string',num2str(theta6));


%get the angle
set_param([ModelName '/Slider Gain'],'Gain',num2str(theta1));
set_param([ModelName '/Slider Gain1'],'Gain',num2str(theta2));
set_param([ModelName '/Slider Gain2'],'Gain',num2str(theta3));
set_param([ModelName '/Slider Gain3'],'Gain',num2str(theta4));
set_param([ModelName '/Slider Gain4'],'Gain',num2str(theta5));
set_param([ModelName '/Slider Gain5'],'Gain',num2str(theta6));

T1 = [  cosd(theta1)  0      sind(theta1)   0;
        sind(theta1)  0      -cosd(theta1)  0;
        0        1      0         l1;
        0        0      0         1];
 
 
T2 = [-sind(theta2)         -cosd(theta2)    0    -l2*sind(theta2);
     cosd(theta2)          -sind(theta2)    0      l2*cosd(theta2);
      0                0           1    0;
      0                0           0    1];
 
 
T3 = [ cosd(theta3)     0    sind(theta3)     l3*cosd(theta3);
       sind(theta3)     0    -cosd(theta3)    l3*sind(theta3);
       0           1    0           0;
       0           0    0           1];
 
 
T4 = [ cosd(theta4)   0     -sind(theta4)  0;
       sind(theta4)   0      cosd(theta4)  0;
       0        -1      0        l4;
       0         0      0        1];
 
T5 = [ cosd(theta5)   0        sind(theta5)   0;
       sind(theta5)   0        -cosd(theta5)  0;
       0         1        0         0;
       0         0        0         1];
 
 
T6 = [ cosd(theta6)     -sind(theta6)   0   0;
       sind(theta6)      cosd(theta6)   0   0;
       0            0         1   l6;
       0            0         0   1];
 
T = T1*T2*T3*T4*T5*T6;

px = T(1,4);
py = T(2,4);
pz = T(3,4);
r11 = T(1,1);
r12 = T(1,2);
r13 = T(1,3);
r21 = T(2,1);
r22 = T(2,2);
r23 = T(2,3);
r31 = T(3,1);
r32 = T(3,2);
r33 = T(3,3);
set(handles.edit47,'string',num2str(px));
set(handles.edit48,'string',num2str(py));
set(handles.edit49,'string',num2str(pz));
set(handles.edit35,'string',num2str(r11));
set(handles.edit39,'string',num2str(r12));
set(handles.edit43,'string',num2str(r13));
set(handles.edit36,'string',num2str(r21));
set(handles.edit40,'string',num2str(r22));
set(handles.edit44,'string',num2str(r23));
set(handles.edit37,'string',num2str(r31));
set(handles.edit41,'string',num2str(r32));
set(handles.edit45,'string',num2str(r33));


% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider6_Callback(hObject, eventdata, handles)
ModelName = 'ROBOT2';
% khai bao bien 
l1=327;
l2=225;
l3=10;
l4=250;
l6=64;


theta1=get(handles.slider3,'value');
set(handles.edit2,'string',num2str(theta1));
theta2=get(handles.slider5,'value');
set(handles.edit3,'string',num2str(theta2));
theta3=get(handles.slider13,'value');
set(handles.edit33,'string',num2str(theta3));
theta4=get(handles.slider4,'value');
set(handles.edit5,'string',num2str(theta4));
theta5=get(handles.slider6,'value');
set(handles.edit6,'string',num2str(theta5));
theta6=get(handles.slider14,'value');
set(handles.edit34,'string',num2str(theta6));


%get the angle
set_param([ModelName '/Slider Gain'],'Gain',num2str(theta1));
set_param([ModelName '/Slider Gain1'],'Gain',num2str(theta2));
set_param([ModelName '/Slider Gain2'],'Gain',num2str(theta3));
set_param([ModelName '/Slider Gain3'],'Gain',num2str(theta4));
set_param([ModelName '/Slider Gain4'],'Gain',num2str(theta5));
set_param([ModelName '/Slider Gain5'],'Gain',num2str(theta6));

T1 = [  cosd(theta1)  0      sind(theta1)   0;
        sind(theta1)  0      -cosd(theta1)  0;
        0        1      0         l1;
        0        0      0         1];
 
 
T2 = [-sind(theta2)         -cosd(theta2)    0    -l2*sind(theta2);
     cosd(theta2)          -sind(theta2)    0      l2*cosd(theta2);
      0                0           1    0;
      0                0           0    1];
 
 
T3 = [ cosd(theta3)     0    sind(theta3)     l3*cosd(theta3);
       sind(theta3)     0    -cosd(theta3)    l3*sind(theta3);
       0           1    0           0;
       0           0    0           1];
 
 
T4 = [ cosd(theta4)   0     -sind(theta4)  0;
       sind(theta4)   0      cosd(theta4)  0;
       0        -1      0        l4;
       0         0      0        1];
 
T5 = [ cosd(theta5)   0        sind(theta5)   0;
       sind(theta5)   0        -cosd(theta5)  0;
       0         1        0         0;
       0         0        0         1];
 
 
T6 = [ cosd(theta6)     -sind(theta6)   0   0;
       sind(theta6)      cosd(theta6)   0   0;
       0            0         1   l6;
       0            0         0   1];
 
T = T1*T2*T3*T4*T5*T6;

px = T(1,4);
py = T(2,4);
pz = T(3,4);
r11 = T(1,1);
r12 = T(1,2);
r13 = T(1,3);
r21 = T(2,1);
r22 = T(2,2);
r23 = T(2,3);
r31 = T(3,1);
r32 = T(3,2);
r33 = T(3,3);
set(handles.edit47,'string',num2str(px));
set(handles.edit48,'string',num2str(py));
set(handles.edit49,'string',num2str(pz));
set(handles.edit35,'string',num2str(r11));
set(handles.edit39,'string',num2str(r12));
set(handles.edit43,'string',num2str(r13));
set(handles.edit36,'string',num2str(r21));
set(handles.edit40,'string',num2str(r22));
set(handles.edit44,'string',num2str(r23));
set(handles.edit37,'string',num2str(r31));
set(handles.edit41,'string',num2str(r32));
set(handles.edit45,'string',num2str(r33));


% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider7_Callback(hObject, eventdata, handles)
X=get(handles.slider7,'value');
set(handles.edit7,'string',num2str(X));
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider8_Callback(hObject, eventdata, handles)
Y=get(handles.slider8,'value');
set(handles.edit8,'string',num2str(Y));
% hObject    handle to slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider9_Callback(hObject, eventdata, handles)
Z=get(handles.slider9,'value');
set(handles.edit9,'string',num2str(Z));
% hObject    handle to slider9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit1_Callback(hObject, eventdata, handles)
ModelName = 'ROBOT1';
input = str2double(get(hObject, 'String'));
set_param([ModelName'/Step'],'Final Value', num2str(input));

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



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
ModelName = 'ROBOT2';

% Opens the Simulink model
open_system(ModelName);

set_param(ModelName,'BlockReduction','off');
set_param(ModelName,'StopTime','inf');
set_param(ModelName,'simulationMode','normal');

set_param(ModelName,'StartFcn','1');

set_param(ModelName,'SimulationCommand','start');



% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
clc; clear; close all;

% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
ModelName = 'ROBOT2';
% khai bao bien 
l1=327;
l2=225;
l3=10;
l4=250;
l6=64;
theta1=0;
theta2=0;
theta3=0;
theta4=0;
theta5=0;
theta6=0;
X=314;
Y=0;
Z=562;
theta11=0;
theta22=0;
theta33=0;
theta44=0;
theta55=0;
theta66=0;

%get the angle
set_param([ModelName '/Slider Gain'],'Gain',num2str(theta1));
set_param([ModelName '/Slider Gain1'],'Gain',num2str(theta2));
set_param([ModelName '/Slider Gain2'],'Gain',num2str(theta3));
set_param([ModelName '/Slider Gain3'],'Gain',num2str(theta4));
set_param([ModelName '/Slider Gain4'],'Gain',num2str(theta5));
set_param([ModelName '/Slider Gain5'],'Gain',num2str(theta6));

T1 = [  cosd(theta1)  0      sind(theta1)   0;
        sind(theta1)  0      -cosd(theta1)  0;
        0        1      0         l1;
        0        0      0         1];
 
 
T2 = [-sind(theta2)         -cosd(theta2)    0    -l2*sind(theta2);
     cosd(theta2)          -sind(theta2)    0      l2*cosd(theta2);
      0                0           1    0;
      0                0           0    1];
 
 
T3 = [ cosd(theta3)     0    sind(theta3)     l3*cosd(theta3);
       sind(theta3)     0    -cosd(theta3)    l3*sind(theta3);
       0           1    0           0;
       0           0    0           1];
 
 
T4 = [ cosd(theta4)   0     -sind(theta4)  0;
       sind(theta4)   0      cosd(theta4)  0;
       0        -1      0        l4;
       0         0      0        1];
 
T5 = [ cosd(theta5)   0        sind(theta5)   0;
       sind(theta5)   0        -cosd(theta5)  0;
       0         1        0         0;
       0         0        0         1];
 
 
T6 = [ cosd(theta6)     -sind(theta6)   0   0;
       sind(theta6)      cosd(theta6)   0   0;
       0            0         1   l6;
       0            0         0   1];

T = T1*T2*T3*T4*T5*T6;

px = T(1,4);
py = T(2,4);
pz = T(3,4);
r11 = T(1,1);
r12 = T(1,2);
r13 = T(1,3);
r21 = T(2,1);
r22 = T(2,2);
r23 = T(2,3);
r31 = T(3,1);
r32 = T(3,2);
r33 = T(3,3);
set(handles.edit47,'string',num2str(px));
set(handles.edit48,'string',num2str(py));
set(handles.edit49,'string',num2str(pz));
set(handles.edit35,'string',num2str(r11));
set(handles.edit39,'string',num2str(r12));
set(handles.edit43,'string',num2str(r13));
set(handles.edit36,'string',num2str(r21));
set(handles.edit40,'string',num2str(r22));
set(handles.edit44,'string',num2str(r23));
set(handles.edit37,'string',num2str(r31));
set(handles.edit41,'string',num2str(r32));
set(handles.edit45,'string',num2str(r33));
set(handles.slider3,'value',theta1);
set(handles.slider5,'value',theta2);
set(handles.slider13,'value',theta3);
set(handles.slider4,'value',theta4);
set(handles.slider6,'value',theta5);
set(handles.slider14,'value',theta6);
set(handles.slider7,'value',X);
set(handles.edit7,'string',num2str(X));
set(handles.slider8,'value',Y);
set(handles.edit8,'string',num2str(Y));
set(handles.slider9,'value',Z);
set(handles.edit9,'string',num2str(Z));
set(handles.edit27,'string',num2str(theta11));
set(handles.edit28,'string',num2str(theta22));
set(handles.edit29,'string',num2str(theta33));
set(handles.edit30,'string',num2str(theta44));
set(handles.edit31,'string',num2str(theta55));
set(handles.edit32,'string',num2str(theta66));
set(handles.edit2,'string',num2str(theta1));
set(handles.edit3,'string',num2str(theta2));
set(handles.edit33,'string',num2str(theta3));
set(handles.edit5,'string',num2str(theta4));
set(handles.edit6,'string',num2str(theta5));
set(handles.edit34,'string',num2str(theta6));

% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
ModelName = 'ROBOT2';
% khai bao bien
l1=327;
l2=225;
l3=10;
l4=250;
l6=64;


t1=get(handles.slider3,'value');
set(handles.edit2,'string',num2str(t1));
t2=get(handles.slider5,'value');
set(handles.edit3,'string',num2str(t2));
t3=get(handles.slider13,'value');
set(handles.edit33,'string',num2str(t3));
t4=get(handles.slider4,'value');
set(handles.edit5,'string',num2str(t4));
t5=get(handles.slider6,'value');
set(handles.edit6,'string',num2str(t5));
t6=get(handles.slider14,'value');
set(handles.edit34,'string',num2str(t6));


%get the angle
set_param([ModelName '/Slider Gain'],'Gain',num2str(t1));
set_param([ModelName '/Slider Gain1'],'Gain',num2str(t2));
set_param([ModelName '/Slider Gain2'],'Gain',num2str(t3));
set_param([ModelName '/Slider Gain3'],'Gain',num2str(t4));
set_param([ModelName '/Slider Gain4'],'Gain',num2str(t5));
set_param([ModelName '/Slider Gain5'],'Gain',num2str(t6));

T1 = [  cos(t1)  0      sin(t1)   0;
        sin(t1)  0      -cos(t1)  0;
        0        1      0         l1;
        0        0      0         1];
 
 
T2 = [-sin(t2)         -cos(t2)   0    -l2*sin(t2);
       cos(t2)         -sin(t2)   0    l2*cos(t2);
       0               0          1    0;
       0               0          0    1];
 
 
T3 = [ cos(t3)     0    sin(t3)     l3*cos(t3);
       sin(t3)     0    -cos(t3)    l3*sin(t3);
       0           1    0           0;
       0           0    0           1];
 
 
T4 = [ cos(t4)   0     -sin(t4)  0;
       sin(t4)   0      cos(t4)  0;
       0        -1      0        l4;
       0         0      0        1];
 
T5 = [ cos(t5)   0        sin(t5)   0;
       sin(t5)   0        -cos(t5)  0;
       0         1        0         0;
       0         0        0         1];
 
 
T6 = [ cos(t6)     -sin(t6)   0   0;
       sin(t6)      cos(t6)   0   0;
       0            0         1   l6;
       0            0         0   1];

T = T1*T2*T3*T4*T5*T6;

px = T(1,4);
py = T(2,4);
pz = T(3,4);
r11 = T(1,1);
r12 = T(1,2);
r13 = T(1,3);
r21 = T(2,1);
r22 = T(2,2);
r23 = T(2,3);
r31 = T(3,1);
r32 = T(3,2);
r33 = T(3,3);
set(handles.edit47,'string',num2str(px));
set(handles.edit48,'string',num2str(py));
set(handles.edit49,'string',num2str(pz));
set(handles.edit35,'string',num2str(r11));
set(handles.edit39,'string',num2str(r12));
set(handles.edit43,'string',num2str(r13));
set(handles.edit36,'string',num2str(r21));
set(handles.edit40,'string',num2str(r22));
set(handles.edit44,'string',num2str(r23));
set(handles.edit37,'string',num2str(r31));
set(handles.edit41,'string',num2str(r32));
set(handles.edit45,'string',num2str(r33));


% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit16_Callback(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit16 as text
%        str2double(get(hObject,'String')) returns contents of edit16 as a double


% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit17_Callback(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit17 as text
%        str2double(get(hObject,'String')) returns contents of edit17 as a double


% --- Executes during object creation, after setting all properties.
function edit17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit18_Callback(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit18 as text
%        str2double(get(hObject,'String')) returns contents of edit18 as a double


% --- Executes during object creation, after setting all properties.
function edit18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit19_Callback(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit19 as text
%        str2double(get(hObject,'String')) returns contents of edit19 as a double


% --- Executes during object creation, after setting all properties.
function edit19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit20_Callback(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit20 as text
%        str2double(get(hObject,'String')) returns contents of edit20 as a double


% --- Executes during object creation, after setting all properties.
function edit20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit21_Callback(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit21 as text
%        str2double(get(hObject,'String')) returns contents of edit21 as a double


% --- Executes during object creation, after setting all properties.
function edit21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit22_Callback(hObject, eventdata, handles)
% hObject    handle to edit22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit22 as text
%        str2double(get(hObject,'String')) returns contents of edit22 as a double


% --- Executes during object creation, after setting all properties.
function edit22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit23_Callback(hObject, eventdata, handles)
% hObject    handle to edit23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit23 as text
%        str2double(get(hObject,'String')) returns contents of edit23 as a double


% --- Executes during object creation, after setting all properties.
function edit23_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit24_Callback(hObject, eventdata, handles)
% hObject    handle to edit24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit24 as text
%        str2double(get(hObject,'String')) returns contents of edit24 as a double


% --- Executes during object creation, after setting all properties.
function edit24_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit25_Callback(hObject, eventdata, handles)
% hObject    handle to edit25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit25 as text
%        str2double(get(hObject,'String')) returns contents of edit25 as a double


% --- Executes during object creation, after setting all properties.
function edit25_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit26_Callback(hObject, eventdata, handles)
% hObject    handle to edit26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit26 as text
%        str2double(get(hObject,'String')) returns contents of edit26 as a double


% --- Executes during object creation, after setting all properties.
function edit26_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit27_Callback(hObject, eventdata, handles)
% hObject    handle to edit27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit27 as text
%        str2double(get(hObject,'String')) returns contents of edit27 as a double


% --- Executes during object creation, after setting all properties.
function edit27_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit28_Callback(hObject, eventdata, handles)
% hObject    handle to edit28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit28 as text
%        str2double(get(hObject,'String')) returns contents of edit28 as a double


% --- Executes during object creation, after setting all properties.
function edit28_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit29_Callback(hObject, eventdata, handles)
% hObject    handle to edit29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit29 as text
%        str2double(get(hObject,'String')) returns contents of edit29 as a double


% --- Executes during object creation, after setting all properties.
function edit29_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit30_Callback(hObject, eventdata, handles)
% hObject    handle to edit30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit30 as text
%        str2double(get(hObject,'String')) returns contents of edit30 as a double


% --- Executes during object creation, after setting all properties.
function edit30_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit31_Callback(hObject, eventdata, handles)
% hObject    handle to edit31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit31 as text
%        str2double(get(hObject,'String')) returns contents of edit31 as a double


% --- Executes during object creation, after setting all properties.
function edit31_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit32_Callback(hObject, eventdata, handles)
% hObject    handle to edit32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit32 as text
%        str2double(get(hObject,'String')) returns contents of edit32 as a double


% --- Executes during object creation, after setting all properties.
function edit32_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider13_Callback(hObject, eventdata, handles)
ModelName = 'ROBOT2';
% khai bao bien 
l1=327;
l2=225;
l3=10;
l4=250;
l6=64;


theta1=get(handles.slider3,'value');
set(handles.edit2,'string',num2str(theta1));
theta2=get(handles.slider5,'value');
set(handles.edit3,'string',num2str(theta2));
theta3=get(handles.slider13,'value');
set(handles.edit33,'string',num2str(theta3));
theta4=get(handles.slider4,'value');
set(handles.edit5,'string',num2str(theta4));
theta5=get(handles.slider6,'value');
set(handles.edit6,'string',num2str(theta5));
theta6=get(handles.slider14,'value');
set(handles.edit34,'string',num2str(theta6));


%get the angle
set_param([ModelName '/Slider Gain'],'Gain',num2str(theta1));
set_param([ModelName '/Slider Gain1'],'Gain',num2str(theta2));
set_param([ModelName '/Slider Gain2'],'Gain',num2str(theta3));
set_param([ModelName '/Slider Gain3'],'Gain',num2str(theta4));
set_param([ModelName '/Slider Gain4'],'Gain',num2str(theta5));
set_param([ModelName '/Slider Gain5'],'Gain',num2str(theta6));

T1 = [  cosd(theta1)  0      sind(theta1)   0;
        sind(theta1)  0      -cosd(theta1)  0;
        0        1      0         l1;
        0        0      0         1];
 
 
T2 = [-sind(theta2)         -cosd(theta2)    0    -l2*sind(theta2);
     cosd(theta2)          -sind(theta2)    0      l2*cosd(theta2);
      0                0           1    0;
      0                0           0    1];
 
 
T3 = [ cosd(theta3)     0    sind(theta3)     l3*cosd(theta3);
       sind(theta3)     0    -cosd(theta3)    l3*sind(theta3);
       0           1    0           0;
       0           0    0           1];
 
 
T4 = [ cosd(theta4)   0     -sind(theta4)  0;
       sind(theta4)   0      cosd(theta4)  0;
       0        -1      0        l4;
       0         0      0        1];
 
T5 = [ cosd(theta5)   0        sind(theta5)   0;
       sind(theta5)   0        -cosd(theta5)  0;
       0         1        0         0;
       0         0        0         1];
 
 
T6 = [ cosd(theta6)     -sind(theta6)   0   0;
       sind(theta6)      cosd(theta6)   0   0;
       0            0         1   l6;
       0            0         0   1];
   
T = T1*T2*T3*T4*T5*T6;

px = T(1,4);
py = T(2,4);
pz = T(3,4);
r11 = T(1,1);
r12 = T(1,2);
r13 = T(1,3);
r21 = T(2,1);
r22 = T(2,2);
r23 = T(2,3);
r31 = T(3,1);
r32 = T(3,2);
r33 = T(3,3);
set(handles.edit47,'string',num2str(px));
set(handles.edit48,'string',num2str(py));
set(handles.edit49,'string',num2str(pz));
set(handles.edit35,'string',num2str(r11));
set(handles.edit39,'string',num2str(r12));
set(handles.edit43,'string',num2str(r13));
set(handles.edit36,'string',num2str(r21));
set(handles.edit40,'string',num2str(r22));
set(handles.edit44,'string',num2str(r23));
set(handles.edit37,'string',num2str(r31));
set(handles.edit41,'string',num2str(r32));
set(handles.edit45,'string',num2str(r33));


% hObject    handle to slider13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider14_Callback(hObject, eventdata, handles)
ModelName = 'ROBOT2';
% khai bao bien 
l1=327;
l2=225;
l3=10;
l4=250;
l6=64;


theta1=get(handles.slider3,'value');
set(handles.edit2,'string',num2str(theta1));
theta2=get(handles.slider5,'value');
set(handles.edit3,'string',num2str(theta2));
theta3=get(handles.slider13,'value');
set(handles.edit33,'string',num2str(theta3));
theta4=get(handles.slider4,'value');
set(handles.edit5,'string',num2str(theta4));
theta5=get(handles.slider6,'value');
set(handles.edit6,'string',num2str(theta5));
theta6=get(handles.slider14,'value');
set(handles.edit34,'string',num2str(theta6));


%get the angle
set_param([ModelName '/Slider Gain'],'Gain',num2str(theta1));
set_param([ModelName '/Slider Gain1'],'Gain',num2str(theta2));
set_param([ModelName '/Slider Gain2'],'Gain',num2str(theta3));
set_param([ModelName '/Slider Gain3'],'Gain',num2str(theta4));
set_param([ModelName '/Slider Gain4'],'Gain',num2str(theta5));
set_param([ModelName '/Slider Gain5'],'Gain',num2str(theta6));

T1 = [  cosd(theta1)  0      sind(theta1)   0;
        sind(theta1)  0      -cosd(theta1)  0;
        0        1      0         l1;
        0        0      0         1];
 
 
T2 = [-sind(theta2)         -cosd(theta2)    0    -l2*sind(theta2);
     cosd(theta2)          -sind(theta2)    0      l2*cosd(theta2);
      0                0           1    0;
      0                0           0    1];
 
 
T3 = [ cosd(theta3)     0    sind(theta3)     l3*cosd(theta3);
       sind(theta3)     0    -cosd(theta3)    l3*sind(theta3);
       0           1    0           0;
       0           0    0           1];
 
 
T4 = [ cosd(theta4)   0     -sind(theta4)  0;
       sind(theta4)   0      cosd(theta4)  0;
       0        -1      0        l4;
       0         0      0        1];
 
T5 = [ cosd(theta5)   0        sind(theta5)   0;
       sind(theta5)   0        -cosd(theta5)  0;
       0         1        0         0;
       0         0        0         1];
 
 
T6 = [ cosd(theta6)     -sind(theta6)   0   0;
       sind(theta6)      cosd(theta6)   0   0;
       0            0         1   l6;
       0            0         0   1];
 
T = T1*T2*T3*T4*T5*T6;

px = T(1,4);
py = T(2,4);
pz = T(3,4);
r11 = T(1,1);
r12 = T(1,2);
r13 = T(1,3);
r21 = T(2,1);
r22 = T(2,2);
r23 = T(2,3);
r31 = T(3,1);
r32 = T(3,2);
r33 = T(3,3);
set(handles.edit47,'string',num2str(px));
set(handles.edit48,'string',num2str(py));
set(handles.edit49,'string',num2str(pz));
set(handles.edit35,'string',num2str(r11));
set(handles.edit39,'string',num2str(r12));
set(handles.edit43,'string',num2str(r13));
set(handles.edit36,'string',num2str(r21));
set(handles.edit40,'string',num2str(r22));
set(handles.edit44,'string',num2str(r23));
set(handles.edit37,'string',num2str(r31));
set(handles.edit41,'string',num2str(r32));
set(handles.edit45,'string',num2str(r33));


% hObject    handle to slider14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit33_Callback(hObject, eventdata, handles)
% hObject    handle to edit33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit33 as text
%        str2double(get(hObject,'String')) returns contents of edit33 as a double


% --- Executes during object creation, after setting all properties.
function edit33_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit34_Callback(hObject, eventdata, handles)
% hObject    handle to edit34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit34 as text
%        str2double(get(hObject,'String')) returns contents of edit34 as a double


% --- Executes during object creation, after setting all properties.
function edit34_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit35_Callback(hObject, eventdata, handles)
% hObject    handle to edit35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit35 as text
%        str2double(get(hObject,'String')) returns contents of edit35 as a double


% --- Executes during object creation, after setting all properties.
function edit35_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit36_Callback(hObject, eventdata, handles)
% hObject    handle to edit36 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit36 as text
%        str2double(get(hObject,'String')) returns contents of edit36 as a double


% --- Executes during object creation, after setting all properties.
function edit36_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit36 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit37_Callback(hObject, eventdata, handles)
% hObject    handle to edit37 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit37 as text
%        str2double(get(hObject,'String')) returns contents of edit37 as a double


% --- Executes during object creation, after setting all properties.
function edit37_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit37 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit38_Callback(hObject, eventdata, handles)
% hObject    handle to edit38 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit38 as text
%        str2double(get(hObject,'String')) returns contents of edit38 as a double


% --- Executes during object creation, after setting all properties.
function edit38_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit38 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit39_Callback(hObject, eventdata, handles)
% hObject    handle to edit39 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit39 as text
%        str2double(get(hObject,'String')) returns contents of edit39 as a double


% --- Executes during object creation, after setting all properties.
function edit39_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit39 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit40_Callback(hObject, eventdata, handles)
% hObject    handle to edit40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit40 as text
%        str2double(get(hObject,'String')) returns contents of edit40 as a double


% --- Executes during object creation, after setting all properties.
function edit40_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit41_Callback(hObject, eventdata, handles)
% hObject    handle to edit41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit41 as text
%        str2double(get(hObject,'String')) returns contents of edit41 as a double


% --- Executes during object creation, after setting all properties.
function edit41_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit42_Callback(hObject, eventdata, handles)
% hObject    handle to edit42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit42 as text
%        str2double(get(hObject,'String')) returns contents of edit42 as a double


% --- Executes during object creation, after setting all properties.
function edit42_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit43_Callback(hObject, eventdata, handles)
% hObject    handle to edit43 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit43 as text
%        str2double(get(hObject,'String')) returns contents of edit43 as a double


% --- Executes during object creation, after setting all properties.
function edit43_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit43 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit44_Callback(hObject, eventdata, handles)
% hObject    handle to edit44 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit44 as text
%        str2double(get(hObject,'String')) returns contents of edit44 as a double


% --- Executes during object creation, after setting all properties.
function edit44_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit44 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit45_Callback(hObject, eventdata, handles)
% hObject    handle to edit45 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit45 as text
%        str2double(get(hObject,'String')) returns contents of edit45 as a double


% --- Executes during object creation, after setting all properties.
function edit45_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit45 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit46_Callback(hObject, eventdata, handles)
% hObject    handle to edit46 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit46 as text
%        str2double(get(hObject,'String')) returns contents of edit46 as a double


% --- Executes during object creation, after setting all properties.
function edit46_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit46 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit47_Callback(hObject, eventdata, handles)
% hObject    handle to edit47 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit47 as text
%        str2double(get(hObject,'String')) returns contents of edit47 as a double


% --- Executes during object creation, after setting all properties.
function edit47_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit47 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit48_Callback(hObject, eventdata, handles)
% hObject    handle to edit48 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit48 as text
%        str2double(get(hObject,'String')) returns contents of edit48 as a double


% --- Executes during object creation, after setting all properties.
function edit48_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit48 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit49_Callback(hObject, eventdata, handles)
% hObject    handle to edit49 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit49 as text
%        str2double(get(hObject,'String')) returns contents of edit49 as a double


% --- Executes during object creation, after setting all properties.
function edit49_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit49 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit50_Callback(hObject, eventdata, handles)
% hObject    handle to edit50 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit50 as text
%        str2double(get(hObject,'String')) returns contents of edit50 as a double


% --- Executes during object creation, after setting all properties.
function edit50_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit50 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider15_Callback(hObject, eventdata, handles)
ModelName = 'ROBOT2';
% khai bao bien
a2 = 225;
a3 = 10;
d1 = 327;
d4 = 250;
d6 = 64;

theta1=get(handles.slider3,'value');
set(handles.edit2,'string',num2str(theta1));
theta2=get(handles.slider5,'value');
set(handles.edit3,'string',num2str(theta2));
theta3=get(handles.slider13,'value');
set(handles.edit33,'string',num2str(theta3));
theta4=get(handles.slider4,'value');
set(handles.edit5,'string',num2str(theta4));
theta5=get(handles.slider6,'value');
set(handles.edit6,'string',num2str(theta5));
theta6=get(handles.slider14,'value');
set(handles.edit34,'string',num2str(theta6));


%get the angle
set_param([ModelName '/Slider Gain'],'Gain',num2str(theta1));
set_param([ModelName '/Slider Gain1'],'Gain',num2str(theta2));
set_param([ModelName '/Slider Gain2'],'Gain',num2str(theta3));
set_param([ModelName '/Slider Gain3'],'Gain',num2str(theta4));
set_param([ModelName '/Slider Gain4'],'Gain',num2str(theta5));
set_param([ModelName '/Slider Gain5'],'Gain',num2str(theta6));

T1 =  [cosd(theta1) 0  sind(theta1)  0;
       sind(theta1) 0  -cosd(theta1) 0;
       0            1  0             d1;
       0            0  0             1];
 
 
T2 =  [cosd(theta2 + pi/2) -sind(theta2 + pi/2)  0   a2*cosd(theta2 + pi/2);
       sind(theta2 + pi/2)  cosd(theta2 + pi/2)  0   a2*sind(theta2 + pi/2);
       0                0                1   0;
       0                0                0   1];
  

 
 
T3 = [ cosd(theta3) 0    sind(theta3)   a3*cosd(theta3);
       sind(theta3) 0    -cosd(theta3)  a3*sind(theta3);
       0            1    0              0;
       0            0    0              1];
 

 
 
T4 = [ cosd(theta4)  0    -sind(theta4)  0;
       sind(theta4)  0     cosd(theta4)  0;
       0             -1    0             d4;
       0             0     0             1];
 
 
 
 
T5 = [ cosd(theta5)  0     sind(theta5)    0;
       sind(theta5)  0     -cosd(theta5)   0;
       0             1     0               0;
       0             0     0               1];
 

 
T6 = [ cosd(theta6)      -sind(theta6)  0    0;
       sind(theta6)      cosd(theta6)   0    0;
       0                 0              1    d6;
       0                 0              0    1];
 
T = T1*T2*T3*T4*T5*T6;

px = T(1,4);
py = T(2,4);
pz = T(3,4);
r11 = T(1,1);
r12 = T(1,2);
r13 = T(1,3);
r21 = T(2,1);
r22 = T(2,2);
r23 = T(2,3);
r31 = T(3,1);
r32 = T(3,2);
r33 = T(3,3);
set(handles.edit47,'string',num2str(px));
set(handles.edit48,'string',num2str(py));
set(handles.edit49,'string',num2str(pz));
set(handles.edit35,'string',num2str(r11));
set(handles.edit39,'string',num2str(r12));
set(handles.edit43,'string',num2str(r13));
set(handles.edit36,'string',num2str(r21));
set(handles.edit40,'string',num2str(r22));
set(handles.edit44,'string',num2str(r23));
set(handles.edit37,'string',num2str(r31));
set(handles.edit41,'string',num2str(r32));
set(handles.edit45,'string',num2str(r33));


% hObject    handle to slider15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function pushbutton10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function pushbutton2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
