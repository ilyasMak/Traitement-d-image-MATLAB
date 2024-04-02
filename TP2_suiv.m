function varargout = TP2_suiv(varargin)


gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TP2_suiv_OpeningFcn, ...
                   'gui_OutputFcn',  @TP2_suiv_OutputFcn, ...
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


% --- Executes just before TP2_suiv is made visible.
function TP2_suiv_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
imshow(imread("logEnsa.png"), 'Parent', handles.axes30);



% --- Outputs from this function are returned to the command line.
function varargout = TP2_suiv_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


% --- Executes on button press in II1.
function II1_Callback(hObject, eventdata, handles)
global img1
[filename, pathname] = uigetfile({'*.jpg';'*.png'}, 'Select an image file');
    if ~isequal(filename, 0)
        
        img1 = imread(fullfile(pathname, filename));
        imshow(img1, 'Parent', handles.axes1);
         colorbar('peer', handles.axes1);
        % Add title to axes object
        title(handles.axes1, 'Image 1 Origine');
    else
        % User canceled file selection
    end

%-----------------------------------------------------
     img_inverse = imcomplement(img1);
imshow(img_inverse, 'Parent', handles.axes2);
colorbar('peer', handles.axes2);


% --- Executes on button press in II2.
function II2_Callback(hObject, eventdata, handles)
global img2
[filename, pathname] = uigetfile({'*.jpg';'*.png'}, 'Select an image file');
    if ~isequal(filename, 0)
        
        img2 = imread(fullfile(pathname, filename));
        imshow(img2, 'Parent', handles.axes14);
        imshow(img2, 'Parent', handles.axes27);
        imshow(histeq(img2), 'Parent', handles.axes28);
        bar(imhist(histeq(img2)), 'Parent', handles.axes29);
         colorbar('peer', handles.axes14);
        % Add title to axes object
        title(handles.axes14, 'Image 2 Origine');
    else
        % User canceled file selection
    end
    img2_lumin=imadd(img2,img2,'uint8'); 
imshow(img2_lumin, 'Parent', handles.axes13);
colorbar('peer', handles.axes13);
%----------------------------------------------------

img2_gris = rgb2gray(img2);
hist1 = imhist(img2_gris);
bar(hist1, 'Parent', handles.axes15);
title(handles.axes15, 'Histogramme image 2');
%-------------------------------------------------------
gamma_values = [0.05, 0.1, 0.2, 0.5, 1, 1.5, 2, 3, 4];
axes = [handles.axes4, handles.axes5, handles.axes6, handles.axes7, handles.axes8, handles.axes9, handles.axes10, handles.axes11, handles.axes12];

for i = 1:length(gamma_values)
    i1_gamma = imadjust(img2, [], [], gamma_values(i));
    imshow(i1_gamma, 'Parent', axes(i));
    colorbar('peer', axes(i));
end
%-------------------------------------------
bar(imhist(img2(:,:,1)), 'Parent', handles.axes20);
bar(imhist(img2(:,:,2)), 'Parent', handles.axes21);
bar(imhist(img2(:,:,3)), 'Parent', handles.axes22);
%-------------------------------------------
imshow(histeq(img2(:,:,1)), 'Parent', handles.axes24);
imshow(histeq(img2(:,:,2)), 'Parent', handles.axes25);
imshow(histeq(img2(:,:,3)), 'Parent', handles.axes26);


function seuil_Callback(hObject, eventdata, handles)
global seuil 
seuil=get(handles.seuil,'String');


% --- Executes during object creation, after setting all properties.
function seuil_CreateFcn(hObject, eventdata, handles)
% hObject    handle to seuil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in BI.
function BI_Callback(hObject, eventdata, handles)
global seuil 
global img2 
Img_binariser=benariserImage(img2,str2num(seuil));
imshow(Img_binariser, 'Parent', handles.axes16);
