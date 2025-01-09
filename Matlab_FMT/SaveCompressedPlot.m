function SaveCompressedPlot(figHandle, filename, format, quality)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
arguments
    figHandle matlab.ui.Figure = gcf
    filename string
    format string {mustBeMember(format, {'png','jpg','jpeg','tiff','bmp'})}
    quality (1,1) double {mustBeInRange(quality, 0, 100)} = 90
end

[~, ~, ext] = fileparts(filename);
ext = char(ext);
ext = string(ext(2:end));
if isempty(ext)
    filename  = strcat(filename,'.',format);
elseif ~strcmpi(ext,format)
    error ('File extenstion does not match with the specified format')
end

switch lower(format)
        case {'jpg', 'jpeg'}
            % Save as a JPEG file with specified quality
            exportgraphics(figHandle, filename, 'Resolution', 300, ...
                'ContentType', 'image', 'Quality', quality);
        case {'png', 'tiff', 'bmp'}
            % For PNG, TIFF, BMP (no quality control, just save)
            exportgraphics(figHandle, filename, 'Resolution', 300, ...
                'ContentType', 'image');
        otherwise
            error('Unsupported format: %s', format);
end
end