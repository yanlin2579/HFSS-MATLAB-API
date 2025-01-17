% ----------------------------------------------------------------------------
% function hfssMove(fid, ObjList, tVector, Units)
% 
% Description :
% -------------
% Creates the VB Script necessary to move a given set of objects.
%
% Parameters :
% ------------
% fid     - file identifier of the HFSS script file.
% ObjList - a cell array of objects that need to be moved.
% tVector - a translation vector that defines the motion (specify as 
%           [tx, ty, tz]).
% Units   - units for the transalation vector (use 'in', 'mm', 'meter' or 
%           anything else defined in HFSS).
% 
% Note :
% ------
%
% Example :
% ---------
% fid = fopen('myantenna.vbs', 'wt');
% ... create some objects here ...
% hfssMove(fid, {'Dipole1', 'Dipole2'}, [0, d, 0], 'in');
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
function hfssMove(fid, ObjectList, tVector, Units)

nObjects = length(ObjectList);

tVector = reshape(tVector, length(tVector), 1);
if iscell(tVector)
    1;
else
    tVector = mat2cell(tVector,[1,1,1],1);
end
% Preamble.
fprintf(fid, '\n');
fprintf(fid, 'oEditor.Move _\n');
fprintf(fid, 'Array("NAME:Selections", _\n');

% Object Selections.
fprintf(fid, '"Selections:=", "');
for iObj = 1:nObjects,
	fprintf(fid, '%s', ObjectList{iObj});
	if (iObj ~= nObjects)
		fprintf(fid, ',');
	end;
end;
fprintf(fid, '"), _\n');

% Transalation Vector.
fprintf(fid, 'Array("NAME:TranslateParameters", _\n');

if isnumeric(tVector{1,1})
    fprintf(fid, '"TranslateVectorX:=", "%f%s", _\n', tVector{1,1}, Units);
else
    fprintf(fid, '"TranslateVectorX:=", "%s", _\n', tVector{1,1});
end
    
if isnumeric(tVector{2,1})
    fprintf(fid, '"TranslateVectorY:=", "%f%s", _\n', tVector{2,1}, Units);
else
    fprintf(fid, '"TranslateVectorY:=", "%s", _\n', tVector{2,1});
end
  
if isnumeric(tVector{3,1})
   fprintf(fid, '"TranslateVectorZ:=", "%f%s") _\n', tVector{3,1}, Units);
else
     fprintf(fid, '"TranslateVectorZ:=", "%s") _\n', tVector{3,1});
end
%fprintf(fid, '"TranslateVectorX:=", "%f%s", _\n', tVector(1), Units);
%fprintf(fid, '"TranslateVectorY:=", "%f%s", _\n', tVector(2), Units);
%fprintf(fid, '"TranslateVectorZ:=", "%f%s")\n', tVector(3), Units);
