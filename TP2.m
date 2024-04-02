function varargout = TP2(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TP2_OpeningFcn, ...
                   'gui_OutputFcn',  @TP2_OutputFcn, ...
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


% --- Executes just before TP2 is made visible.
function TP2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TP2 (see VARARGIN)

% Choose default command line output for TP2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
imshow(imread("logEnsa.png"), 'Parent', handles.axes29);
% UIWAIT makes TP2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TP2_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


% --- Executes on button press in Inserer_Image.
function Inserer_Image_Callback(hObject, eventdata, handles)
global img
[filename, pathname] = uigetfile({'*.jpg';'*.png'}, 'Select an image file');
    if ~isequal(filename, 0)
        % User selected a file
        % Read image data into variable
        img = imread(fullfile(pathname, filename));
        % Display image in axes object
        imshow(img, 'Parent', handles.axes1);
         colorbar('peer', handles.axes1);
        % Add title to axes object
        title(handles.axes1, 'Image Origine');
    else
        % User canceled file selection
    end
    im64 = imresize(img, [64 NaN]);
    im512 = imresize(img, [512 NaN]);
    im256 = imresize(img, [256 NaN]);
    im128 = imresize(img, [128 NaN]);
    im32 = imresize(img, [32 NaN]);
    im16 = imresize(img, [16 NaN]);
    im4 = imresize(img, [4 NaN]);
    im8 = imresize(img, [8 NaN]);
    im2 = imresize(img, [2 NaN]);
    imshow(im2, 'Parent', handles.axes2);
    colorbar('peer', handles.axes2);
    imshow(im128, 'Parent', handles.axes4);
    colorbar('peer', handles.axes4);
    imshow(im512, 'Parent', handles.axes10);
    colorbar('peer', handles.axes10);
    imshow(im256, 'Parent', handles.axes5);
    colorbar('peer', handles.axes5);
    imshow(im4, 'Parent', handles.axes8);
    colorbar('peer', handles.axes8);
    imshow(im8, 'Parent', handles.axes6);
    colorbar('peer', handles.axes6);
    imshow(im16, 'Parent', handles.axes7);
    colorbar('peer', handles.axes7);
    imshow(im32, 'Parent', handles.axes9);
    colorbar('peer', handles.axes9);
    imshow(im64, 'Parent', handles.axes3);
    colorbar('peer', handles.axes3);
    %--------------------------------------------------
    img_gris = rgb2gray(img);
imshow(img_gris, 'Parent', handles.axes21);
colorbar('peer', handles.axes21);


niveaux = [2, 4, 8, 16, 32, 64, 128];
axes = [handles.axes22, handles.axes23, handles.axes24, handles.axes25, handles.axes26, handles.axes27, handles.axes28];

% Loop over different levels of quantization
for i = 1:length(niveaux)
    % Quantize the grayscale image
    img_Quantifier = uint8(floor(double(img_gris)/(256/niveaux(i)))*(256/niveaux(i)));

    % Display the quantized image
    imshow(img_Quantifier, 'Parent', axes(i));
    colorbar('peer', axes(i));
end


% --- Executes on button press in suivant.
function suivant_Callback(hObject, eventdata, handles)

TP2_suiv;
