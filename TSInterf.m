function varargout = TSInterf(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TSInterf_OpeningFcn, ...
                   'gui_OutputFcn',  @TSInterf_OutputFcn, ...
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


% --- Executes just before TSInterf is made visible.
function TSInterf_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
imshow(imread("logEnsa.png"), 'Parent', handles.axes2);
imshow(imread("titModule.PNG"), 'Parent', handles.axes3);

function varargout = TSInterf_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


% --- Executes on button press in TP1.
function TP1_Callback(hObject, eventdata, handles)
TP1



% --- Executes on button press in TP2.
function TP2_Callback(hObject, eventdata, handles)
TP2



% --- Executes on button press in TP3.
function TP3_Callback(hObject, eventdata, handles)
TP3



function nomImage_Callback(hObject, eventdata, handles)



function nomImage_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


  
% --- Executes on button press in ButtonInserImage.
function ButtonInserImage_Callback(hObject, eventdata, handles)
   [filename, pathname] = uigetfile({'*.jpg';'*.png'}, 'Select an image file');
    if ~isequal(filename, 0)
       
        img = imread(fullfile(pathname, filename));
        
        imshow(img, 'Parent', handles.axes1);
         colorbar('peer', handles.axes1);
        % Add title to axes object
        title(handles.axes1, 'My Image');
    else
        % User canceled file selection
    end
