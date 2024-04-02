function varargout = TP1(varargin)
  


% TP1 MATLAB code for TP1.fig
%      TP1, by itself, creates a new TP1 or raises the existing
%      singleton*.
%
%      H = TP1 returns the handle to a new TP1 or the handle to
%      the existing singleton*.
%
%      TP1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TP1.M with the given input arguments.
%
%      TP1('Property','Value',...) creates a new TP1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TP1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TP1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TP1

% Last Modified by GUIDE v2.5 20-Apr-2023 02:51:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TP1_OpeningFcn, ...
                   'gui_OutputFcn',  @TP1_OutputFcn, ...
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


% --- Executes just before TP1 is made visible.
function TP1_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TP1 (see VARARGIN)
set(handles.figure1, 'Scrollable', 'on');
% Choose default command line output for TP1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
imshow(imread("logEnsa.png"), 'Parent', handles.axes22);

% UIWAIT makes TP1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TP1_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Inserer_Image.

function Inserer_Image_Callback(~, ~, handles)
% hObject    handle to Inserer_Image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img 
  [filename, pathname] = uigetfile({'*.jpg';'*.png'}, 'Select an image file');
    if ~isequal(filename, 0)
        % User selected a file
        % Read image data into variable
        img = imread(fullfile(pathname, filename));
        im1= CarreBland(img);
        % Display image in axes object
        imshow(img, 'Parent', handles.axes1);
         colorbar('peer', handles.axes1);
        % Add title to axes object
        title(handles.axes1, 'Image origine');
    else
        % User canceled file selection
    end
    % hObject    handle to infromation_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
info = imfinfo(fullfile(pathname, filename));
        % Display image information in text object
  set(handles.info_image, 'String', sprintf('Nom de fichier: %s\nLargeur: %d\nLongeur: %d\nBits: %d\nType Image :  %s', info.Filename, info.Width, info.Height, info.BitDepth,info.Format));

imshow(im1, 'Parent', handles.axes2);
rouge=img ;
rouge(:,:,2)=0 ;
rouge(:,:,3)=0 ; 
vert=img ; 
vert(:,:,1)=0 ;
vert(:,:,3)=0 ; 
bleu=img ;
bleu(:,:,1)=0 ;
bleu(:,:,2)=0 ; 
imshow(rouge, 'Parent', handles.axes6);
imshow(vert, 'Parent', handles.axes7);
imshow(bleu, 'Parent', handles.axes8);


% --- Executes on button press in infromation_image.



function X_Callback(~, ~, handles)
% hObject    handle to X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of X as text
%        str2double(get(hObject,'String')) returns contents of X as a double
global X 
X = get(handles.X, 'String');



% --- Executes during object creation, after setting all properties.
function X_CreateFcn(hObject, ~, ~)
% hObject    handle to X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Y_Callback(~, ~, handles)
% hObject    handle to Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Y as text
%        str2double(get(hObject,'String')) returns contents of Y as a double
global Y 
Y = get(handles.Y, 'String');


% --- Executes during object creation, after setting all properties.
function Y_CreateFcn(hObject, ~, ~)
% hObject    handle to Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Info_pix.
function Info_pix_Callback(~, ~, handles)

% hObject    handle to Info_pix (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img 
global X 
global Y
 set(handles.info_pixe, 'String', impixel(img,str2num(X),str2num(Y) )) ;


% --- Executes on button press in page_suivat.
function page_suivat_Callback(hObject, eventdata, handles)
global img 
% hObject    handle to page_suivat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
TP1_suiv(img)
