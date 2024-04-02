function varargout = TP1_suiv(varargin)
% TP1_SUIV MATLAB code for TP1_suiv.fig
%      TP1_SUIV, by itself, creates a new TP1_SUIV or raises the existing
%      singleton*.
%
%      H = TP1_SUIV returns the handle to a new TP1_SUIV or the handle to
%      the existing singleton*.
%
%      TP1_SUIV('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TP1_SUIV.M with the given input arguments.
%
%      TP1_SUIV('Property','Value',...) creates a new TP1_SUIV or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TP1_suiv_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TP1_suiv_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TP1_suiv

% Last Modified by GUIDE v2.5 20-Apr-2023 03:38:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TP1_suiv_OpeningFcn, ...
                   'gui_OutputFcn',  @TP1_suiv_OutputFcn, ...
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


% --- Executes just before TP1_suiv is made visible.
function TP1_suiv_OpeningFcn(hObject, eventdata, handles, varargin)
global img

% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TP1_suiv (see VARARGIN)

% Choose default command line output for TP1_suiv
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
imshow(imread("logEnsa.png"), 'Parent', handles.axes8);
 imshow(img, 'Parent', handles.axes1);
  colorbar('peer', handles.axes1);
        % Add title to axes object
        title(handles.axes1, 'Image origine');
imggr=rgb2gray(img);
[imgind,i]=rgb2ind(img,500) ;
ycbcrImg= rgb2ycbcr(img);
hsvImg=rgb2hsv(img);
 imshow(imggr, 'Parent', handles.axes2);  
imshow(imgind, 'Parent', handles.axes3);  
imshow(ycbcrImg, 'Parent', handles.axes4);  
imshow(hsvImg, 'Parent', handles.axes5); 
% UIWAIT makes TP1_suiv wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TP1_suiv_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function angl_trn_Callback(hObject, eventdata, handles)
% hObject    handle to angl_trn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of angl_trn as text
%        str2double(get(hObject,'String')) returns contents of angl_trn as a double
global angle
angle = get(handles.angl_trn, 'String');


% --- Executes during object creation, after setting all properties.
function angl_trn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to angl_trn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in image_tourner.
function image_tourner_Callback(hObject, eventdata, handles)
% hObject    handle to image_tourner (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global angle 
global img 
imgr=imrotate(img,str2num(angle));
imshow(imgr, 'Parent', handles.axes6); 



function zoom1_Callback(hObject, eventdata, handles)
% hObject    handle to zoom1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of zoom1 as text
%        str2double(get(hObject,'String')) returns contents of zoom1 as a double
global zoom1 
zoom1 = get(handles.zoom1, 'String');



% --- Executes during object creation, after setting all properties.
function zoom1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to zoom1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function zoom2_Callback(hObject, eventdata, handles)
% hObject    handle to zoom2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of zoom2 as text
%        str2double(get(hObject,'String')) returns contents of zoom2 as a double
global zoom2 
zoom2 = get(handles.zoom2, 'String');

% --- Executes during object creation, after setting all properties.
function zoom2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to zoom2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function zoom3_Callback(hObject, eventdata, handles)
% hObject    handle to zoom3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of zoom3 as text
%        str2double(get(hObject,'String')) returns contents of zoom3 as a double
global zoom3
zoom3 = get(handles.zoom3, 'String');

% --- Executes during object creation, after setting all properties.
function zoom3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to zoom3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function zoom4_Callback(hObject, eventdata, handles)
% hObject    handle to zoom4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of zoom4 as text
%        str2double(get(hObject,'String')) returns contents of zoom4 as a double
global zoom4 
zoom4 = get(handles.zoom4, 'String');

% --- Executes during object creation, after setting all properties.
function zoom4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to zoom4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in cop_img.
function cop_img_Callback(hObject, eventdata, handles)
% hObject    handle to cop_img (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img 
global zoom1
global zoom2
global zoom3
global zoom4
imgCr=imcrop(img,[str2num(zoom1) str2num(zoom2) str2num(zoom3) str2num(zoom4)]);
imshow(imgCr, 'Parent', handles.axes7); 
