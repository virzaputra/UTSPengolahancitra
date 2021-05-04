function varargout = UTS(varargin)
% UTS MATLAB code for UTS.fig
%      UTS, by itself, creates a new UTS or raises the existing
%      singleton*.
%
%      H = UTS returns the handle to a new UTS or the handle to
%      the existing singleton*.
%
%      UTS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UTS.M with the given input arguments.
%
%      UTS('Property','Value',...) creates a new UTS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before UTS_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to UTS_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help UTS

% Last Modified by GUIDE v2.5 02-May-2021 10:36:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @UTS_OpeningFcn, ...
                   'gui_OutputFcn',  @UTS_OutputFcn, ...
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


% --- Executes just before UTS is made visible.
function UTS_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to UTS (see VARARGIN)

% Choose default command line output for UTS
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes UTS wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = UTS_OutputFcn(hObject, eventdata, handles) 
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
[filename,pathname] = uigetfile({'*.*'});
 
if ~isequal(filename,0)
    Info = imfinfo(fullfile(pathname,filename));
    if Info.BitDepth == 24
        Img = imread(fullfile(pathname,filename));
        axes(handles.axes1)
        cla('reset')
        imshow(Img)
        title('RGB Image')
    else
        msgbox('Citra masukan harus citra RGB');
        return
    end
else
    return
end
 
handles.Img = Img;
guidata(hObject,handles);
 
set(handles.radiobutton1,'Enable','on')
set(handles.radiobutton2,'Enable','on')
set(handles.radiobutton3,'Enable','on')
set(handles.radiobutton4,'Enable','on')
set(handles.radiobutton5,'Enable','on')


axes(handles.axes2)
cla('reset')
set(gca,'XTick',[])
set(gca,'YTick',[])


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1
set(handles.radiobutton1,'Value',1)
set(handles.radiobutton2,'Value',0)
set(handles.radiobutton3,'Value',0)
set(handles.radiobutton4,'Value',0)
set(handles.radiobutton5,'Value',0)
% Menampilkan gambar RGB yg sudah dipilih
Img = handles.Img;
axes(handles.axes1)
imshow(Img)
title('RGB Image')
R = Img(:,:,1);
G = Img(:,:,2);
B = Img(:,:,3);
% Menampilkan histogram RGB
axes(handles.axes2)
cla('reset')
h = histogram(R(:));
h.FaceColor = [1 0 0];
xlim([0 255])
grid on
hold on
h = histogram(G(:));
h.FaceColor = [0 1 0];
xlim([0 255])
h = histogram(B(:));
h.FaceColor = [0 0 1];
xlim([0 255])
hold off
title('Histogram')


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2
set(handles.radiobutton1,'Value',0)
set(handles.radiobutton2,'Value',1)
set(handles.radiobutton3,'Value',0)
set(handles.radiobutton4,'Value',0)
set(handles.radiobutton5,'Value',0)
Img = handles.Img;
R = Img(:,:,1);
G = Img(:,:,2);
B = Img(:,:,3);
% Untuk merubah gambar RGB menjadi layer Red
Red_Channel = cat(3,R,G*0,B*0);
axes(handles.axes1)
cla('reset')
imshow(Red_Channel)
title('Red Channel')
% Menampilkan Histogram layer Red
axes(handles.axes2)
cla('reset')
h = histogram(R(:));
h.FaceColor = [1 0 0];
xlim([0 255])
grid on
title('Histogram')

% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3
set(handles.radiobutton1,'Value',0)
set(handles.radiobutton2,'Value',0)
set(handles.radiobutton3,'Value',1)
set(handles.radiobutton4,'Value',0)
set(handles.radiobutton5,'Value',0)
Img = handles.Img;
R = Img(:,:,1);
G = Img(:,:,2);
B = Img(:,:,3);
% Untuk merubah gambar RGB menjadi layer Green
Green_Channel = cat(3,R*0,G,B*0);
axes(handles.axes1)
cla('reset')
imshow(Green_Channel)
title('Green Channel')
% Menampilkan Histogram layer Green
axes(handles.axes2)
cla('reset')
h = histogram(G(:));
h.FaceColor = [0 1 0];
xlim([0 255])
grid on
title('Histogram')

% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4
set(handles.radiobutton1,'Value',0)
set(handles.radiobutton2,'Value',0)
set(handles.radiobutton3,'Value',0)
set(handles.radiobutton4,'Value',1)
set(handles.radiobutton5,'Value',0)
Img = handles.Img;
R = Img(:,:,1);
G = Img(:,:,2);
B = Img(:,:,3);
% Untuk merubah gambar RGB menjadi layer Green
Blue_Channel = cat(3,R*0,G*0,B);
axes(handles.axes1)
cla('reset')
imshow(Blue_Channel)
title('Blue Channel')
% Menampilkan Histogram layer Blue
axes(handles.axes2)
cla('reset')
h = histogram(B(:));
h.FaceColor = [0 0 1];
xlim([0 255])
grid on
title('Histogram')

% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5
set(handles.radiobutton1,'Value',0)
set(handles.radiobutton2,'Value',0)
set(handles.radiobutton3,'Value',0)
set(handles.radiobutton4,'Value',0)
set(handles.radiobutton5,'Value',1)

Img = handles.Img;
Img_Gray=rgb2gray(Img);

axes(handles.axes1)
imshow(Img_Gray)
title('Citra Grayscale')

axes(handles.axes2)
h=histogram(Img_Gray,256);
h.facecolor=[.5 .5 .5]
h.EdgeColor=[.5 .5 .5]
xlim([0,255])
grid on
title ('histogram')

