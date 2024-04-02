function varargout = TP3(varargin)
% TP3 MATLAB code for TP3.fig
%      TP3, by itself, creates a new TP3 or raises the existing
%      singleton*.
%
%      H = TP3 returns the handle to a new TP3 or the handle to
%      the existing singleton*.
%
%      TP3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TP3.M with the given input arguments.
%
%      TP3('Property','Value',...) creates a new TP3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TP3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TP3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TP3

% Last Modified by GUIDE v2.5 20-Apr-2023 14:49:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TP3_OpeningFcn, ...
                   'gui_OutputFcn',  @TP3_OutputFcn, ...
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


% --- Executes just before TP3 is made visible.
function TP3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TP3 (see VARARGIN)

% Choose default command line output for TP3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
imshow(imread("logEnsa.png"), 'Parent', handles.axes2);

% UIWAIT makes TP3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TP3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Inserer_Image.
function Inserer_Image_Callback(hObject, eventdata, handles)
% hObject    handle to Inserer_Image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img 
  [filename, pathname] = uigetfile({'*.jpg';'*.png'}, 'Select an image file');
    if ~isequal(filename, 0)
        % User selected a file
        % Read image data into variable
        img = imread(fullfile(pathname, filename))
        % Display image in axes object
        imshow(img, 'Parent', handles.axes1);
         colorbar('peer', handles.axes1);
        % Add title to axes object
        title(handles.axes1, 'Image origine');
    else
        % User canceled file selection
    end
set(handles.TI, 'String', sprintf('Taille Initiale de fichier: %d*%d donc %d ', size(img,1), size(img,2), Taille_Initiale(img) ));
set(handles.TC, 'String', sprintf('Taille Compresser de fichier:  %d ', Taille_compresser(img) ));
set(handles.Q, 'String', sprintf('Q=Taille Initiale/Taille compresser= %f ', Taille_Initiale(img)/Taille_compresser(img) ));
set(handles.T, 'String', sprintf('T=1/Q= %f ', Taille_compresser(img)/Taille_Initiale(img) ));
set(handles.G, 'String', sprintf('G=(1-T)*100 =%f %', (1-Taille_compresser(img)/Taille_Initiale(img) )*100 ));
if 1-Taille_compresser(img)/Taille_Initiale(img)  >0 
    set(handles.conclusion, 'String', sprintf('Algorithme efficase pour cette Image  , cette image contient des occurence succesive des pixels,, car on a un gain positive ! '));
else
     set(handles.conclusion, 'String', sprintf('Algorithme est pas efficase , car Image ne contiennent pas des occurence succesive des pixels , donc le Gain est negative '));
end

function TC_Callback(hObject, eventdata, handles)
% hObject    handle to TC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TC as text
%        str2double(get(hObject,'String')) returns contents of TC as a double


% --- Executes during object creation, after setting all properties.
function TC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
