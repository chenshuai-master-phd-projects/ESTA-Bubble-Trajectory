function varargout = simu1(varargin)
% SIMU1 M-file for simu1.fig
%      SIMU1, by itself, creates a new SIMU1 or raises the existing
%      singleton*.
%
%      H = SIMU1 returns the handle to a new SIMU1 or the handle to
%      the existing singleton*.
%
%      SIMU1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SIMU1.M with the given input arguments.
%
%      SIMU1('Property','Value',...) creates a new SIMU1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before simu1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to simu1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help simu1

% Last Modified by GUIDE v2.5 08-Apr-2013 19:23:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @simu1_OpeningFcn, ...
                   'gui_OutputFcn',  @simu1_OutputFcn, ...
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


% --- Executes just before simu1 is made visible.
function simu1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to simu1 (see VARARGIN)

% Choose default command line output for simu1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes simu1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = simu1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in checkbox_AddedMass_X.
function checkbox_AddedMass_X_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_AddedMass_X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_AddedMass_X


% --- Executes on button press in checkbox_Drag_X.
function checkbox_Drag_X_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_Drag_X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_Drag_X


% --- Executes on button press in checkbox_Lift_X.
function checkbox_Lift_X_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_Lift_X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_Lift_X


% --- Executes on button press in checkbox_BuoyanceGravity_X.
function checkbox_BuoyanceGravity_X_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_BuoyanceGravity_X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_BuoyanceGravity_X


% --- Executes on button press in checkbox_Basset_X.
function checkbox_Basset_X_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_Basset_X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_Basset_X


% --- Executes on button press in checkbox_Nameless_X.
function checkbox_Nameless_X_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_Nameless_X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_Nameless_X


% --- Executes on button press in pushbutton_X.
function pushbutton_X_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% clear
clc
cla
legend off
x=load('tmp.txt');
dt=0.02;
a=zeros(1,6);
s='';
a(1)=get(handles.checkbox_Nameless_X,'value');
a(2)=get(handles.checkbox_Drag_X,'value');
a(3)=get(handles.checkbox_Lift_X,'value');
a(4)=get(handles.checkbox_AddedMass_X,'value');
a(5)=get(handles.checkbox_Basset_X,'value');
a(6)=get(handles.checkbox_BuoyanceGravity_X,'value');

if a(1)==1
    plot(dt.*x(:,1),x(:,8),'b','Linewidth',2)
    hold on
    s=strvcat(s,'Nameless');
end
if a(2)==1
    plot(dt.*x(:,1),x(:,10),'c','Linewidth',2)
    hold on
    s=strvcat(s,'Drag');
end
if a(3)==1
    plot(dt.*x(:,1),x(:,12),'r','Linewidth',2)
    hold on
    s=strvcat(s,'Lift');
end
if a(4)==1
    plot(dt.*x(:,1),x(:,14),'g','Linewidth',2)
    hold on
    s=strvcat(s,'Added Mass');
end
if a(5)==1
    plot(dt.*x(:,1),x(:,16),'k','Linewidth',2)
    hold on
    s=strvcat(s,'Basset');
end
if a(6)==1
    plot(dt.*x(:,1),x(:,18),'m','Linewidth',2)
    hold on
    s=strvcat(s,'Buoyance&Gravity');
end
legend(s);
title('Forces in X axis')
xlabel('t /s')
ylabel('Forces /N')


% --- Executes on button press in pushbutton_R.
function pushbutton_R_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_R (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla
legend off


% --- Executes on button press in checkbox_AddedMass_Y.
function checkbox_AddedMass_Y_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_AddedMass_Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_AddedMass_Y


% --- Executes on button press in checkbox_Drag_Y.
function checkbox_Drag_Y_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_Drag_Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_Drag_Y


% --- Executes on button press in checkbox_Lift_Y.
function checkbox_Lift_Y_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_Lift_Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_Lift_Y


% --- Executes on button press in checkbox_BuoyanceGravity_Y.
function checkbox_BuoyanceGravity_Y_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_BuoyanceGravity_Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_BuoyanceGravity_Y


% --- Executes on button press in checkbox_Basset_Y.
function checkbox_Basset_Y_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_Basset_Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_Basset_Y


% --- Executes on button press in pushbutton_Y.
function pushbutton_Y_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc
cla
legend off
x=load('tmp.txt');
dt=0.02;
b=zeros(1,6);
s='';
b(1)=get(handles.checkbox_Nameless_Y,'value');
b(2)=get(handles.checkbox_Drag_Y,'value');
b(3)=get(handles.checkbox_Lift_Y,'value');
b(4)=get(handles.checkbox_AddedMass_Y,'value');
b(5)=get(handles.checkbox_Basset_Y,'value');
b(6)=get(handles.checkbox_BuoyanceGravity_Y,'value');

if b(1)==1
    plot(dt.*x(:,1),x(:,9),'b','Linewidth',2)
    hold on
    s=strvcat(s,'Nameless');
end
if b(2)==1
    plot(dt.*x(:,1),x(:,11),'c','Linewidth',2)
    hold on
    s=strvcat(s,'Drag');
end
if b(3)==1
    plot(dt.*x(:,1),x(:,13),'r','Linewidth',2)
    hold on
    s=strvcat(s,'Lift');
end
if b(4)==1
    plot(dt.*x(:,1),x(:,15),'g','Linewidth',2)
    hold on
    s=strvcat(s,'Added Mass');
end
if b(5)==1
    plot(dt.*x(:,1),x(:,17),'k','Linewidth',2)
    hold on
    s=strvcat(s,'Basset');
end
if b(6)==1
    plot(dt.*x(:,1),x(:,19),'m','Linewidth',2)
    hold on
    s=strvcat(s,'Buoyance&Gravity');
end
legend(s);
title('Forces in Y axis')
xlabel('t /s')
ylabel('Forces /N')

% --- Executes on button press in checkbox_Nameless_Y.
function checkbox_Nameless_Y_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_Nameless_Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_Nameless_Y
