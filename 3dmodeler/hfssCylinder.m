% ----------------------------------------------------------------------------
% function hfssCylinder(fid, Name, Axis, Center, Radius, Height, Units)
% 
% Description :
% -------------
% Creates the VB script necessary to model a cylinder in HFSS.
%
% Parameters :
% ------------
% fid     - file identifier of the HFSS script file.
% Name    - name of the cylinder (in HFSS).
% Center  - center of the cylinder (specify as [x, y, z]). This is also the 
%           starting point of the cylinder.
% Axis    - axis of the cylinder (specify as 'X', 'Y', or 'Z').
% Radius  - radius of the cylinder (scalar).
% Height  - height of the cylidner (from the point specified by Center).
% Units   - specify as 'in', 'mm', 'meter' or anything else defined in HFSS.
% 
% Note :
% ------
%
% Example :
% ---------
% fid = fopen('myantenna.vbs', 'wt');
% ... 
% hfssCylinder(fid, 'Cyl1', 'Z', [0, 0, 0], 0.1, 10, 'in');
% ----------------------------------------------------------------------------

% ----------------------------------------------------------------------------
% This file is part of HFSS-MATLAB-API.
%
% HFSS-MATLAB-API is free software; you can redistribute it and/or modify it 
% under the terms of the GNU General Public License as published by the Free 
% Software Foundation; either version 2 of the License, or (at your option) 
% any later version.
%
% HFSS-MATLAB-API is distributed in the hope that it will be useful, but 
% WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
% or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License 
% for more details.
%
% You should have received a copy of the GNU General Public License along with
% Foobar; if not, write to the Free Software Foundation, Inc., 59 Temple 
% Place, Suite 330, Boston, MA  02111-1307  USA
%
% Copyright 2004, Vijay Ramasami (rvc@ku.edu)
% ----------------------------------------------------------------------------
function hfssCylinder(fid, Name, Axis, Center, Radius, Height, Units)
%modifed Code to parametric
Center = reshape(Center, length(Center), 1);

if iscell(Center)
    1;
else
    Center = mat2cell(Center,[1,1,1],1);
end

% Cylinder Parameters.
fprintf(fid, '\n');
fprintf(fid, 'oEditor.CreateCylinder _\n');
fprintf(fid, 'Array("NAME:CylinderParameters", _\n');
if isnumeric(Center{1,1})
    fprintf(fid, '"XCenter:=", "%f%s", _\n', Center{1,1}, Units);
else
    fprintf(fid, '"XCenter:=", "%s", _\n', Center{1,1});
end
    
if isnumeric(Center{2,1})
    fprintf(fid, '"YCenter:=", "%f%s", _\n', Center{2,1}, Units);
else
    fprintf(fid, '"YCenter:=", "%s", _\n', Center{2,1});
end
  
if isnumeric(Center{3,1})
   fprintf(fid, '"ZCenter:=", "%f%s", _\n', Center{3,1}, Units);
else
     fprintf(fid, '"ZCenter:=", "%s", _\n', Center{3,1});
end

if isnumeric(Radius)
    fprintf(fid, '"Radius:=", "%f%s", _\n', Radius, Units);
else
    fprintf(fid, '"Radius:=", "%s", _\n', Radius);
end

if isnumeric(Height)
    fprintf(fid, '"Height:=", "%f%s", _\n', Height, Units);
else
        fprintf(fid, '"Height:=", "%s", _\n', Height);
end

fprintf(fid, '"WhichAxis:=", "%s"), _\n', upper(Axis));

% Cylinder Properties.
fprintf(fid, 'Array("NAME:Attributes", _\n'); 
fprintf(fid, '"Name:=", "%s", _\n', Name);
fprintf(fid, '"Flags:=", "", _\n');
fprintf(fid, '"Color:=", "(132 132 193)", _\n');
fprintf(fid, '"Transparency:=", 0, _\n');
fprintf(fid, '"PartCoordinateSystem:=", "Global", _\n');
fprintf(fid, '"MaterialName:=", "vacuum", _\n');
fprintf(fid, '"SolveInside:=", true)\n');
fprintf(fid, '\n');






%% Orginal Code
% Cylinder Parameters.
%fprintf(fid, '\n');
%fprintf(fid, 'oEditor.CreateCylinder _\n');
%fprintf(fid, 'Array("NAME:CylinderParameters", _\n');
%fprintf(fid, '"XCenter:=", "%f%s", _\n', Center(1), Units);
%fprintf(fid, '"YCenter:=", "%f%s", _\n', Center(2), Units);
%fprintf(fid, '"ZCenter:=", "%f%s", _\n', Center(3), Units);
%fprintf(fid, '"Radius:=", "%f%s", _\n', Radius, Units);
%fprintf(fid, '"Height:=", "%f%s", _\n', Height, Units);
%fprintf(fid, '"WhichAxis:=", "%s"), _\n', upper(Axis));

% Cylinder Properties.
%fprintf(fid, 'Array("NAME:Attributes", _\n'); 
%fprintf(fid, '"Name:=", "%s", _\n', Name);
%fprintf(fid, '"Flags:=", "", _\n');
%fprintf(fid, '"Color:=", "(132 132 193)", _\n');
%fprintf(fid, '"Transparency:=", 0, _\n');
%fprintf(fid, '"PartCoordinateSystem:=", "Global", _\n');
%fprintf(fid, '"MaterialName:=", "vacuum", _\n');
%fprintf(fid, '"SolveInside:=", true)\n');
%fprintf(fid, '\n');
