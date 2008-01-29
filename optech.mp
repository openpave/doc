%
% optech.mp - Shared MetaPost files for OpenPave Technical docs
%
% $OpenPave$
%
% The contents of this file are subject to the Academic Development
% and Distribution License Version 1.0 (the "License"); you may not
% use this file except in compliance with the License.  You should
% have received a copy of the License with this file.  If you did not
% then please contact whoever distributed this file too you, since
% they may be in violation of the License, and this may affect your
% rights under the License.
%
% Software distributed under the License is distributed on an "AS IS"
% basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See
% the License for the specific language governing rights and
% limitations under the License.
%
% The Initial Developer of the Original Software is Jeremy Lea.
%
% Portions Copyright (C) 2006-2008 OpenPave.org.
%
% Contributor(s): Jeremy Lea <reg@openpave.org>.
%

ahangle := 22.61986495;
color opgreen; opgreen = (.262745,.352941,.262745);

numeric cameraang; cameraang := 52;
numeric camerainc; camerainc := 25;
numeric camerarot; camerarot := 90;
numeric cameradis; cameradis := 6;
numeric obsx; obsx := 0;
numeric obsy; obsy := 0;
numeric obsz; obsz := 1;

vardef perspect(expr x, y, z) =
  % Camera x,y,z;
  numeric cx[];
  numeric cy[];
  numeric cz[];
  cx1 := x - cameradis*sind(90-camerainc)*cosd(cameraang);
  cy1 := y - cameradis*sind(90-camerainc)*sind(cameraang);
  cz1 := z - cameradis*cosd(90-camerainc);
  
  % Camera rotation.
  cx2 :=  cosd(cameraang)*cx1+sind(cameraang)*cy1;
  cy2 := -sind(cameraang)*cx1+cosd(cameraang)*cy1;
  cz2 :=  cz1;

  cx3 :=  cosd(90-camerainc)*cx2-sind(90-camerainc)*cz2;
  cy3 :=  cy2;
  cz3 :=  sind(90-camerainc)*cx2+cosd(90-camerainc)*cz2;

  cx4 :=  cosd(-camerarot)*cx3+sind(-camerarot)*cy3;
  cy4 := -sind(-camerarot)*cx3+cosd(-camerarot)*cy3;
  cz4 :=  cz3;

  (cx4-obsx, cy4-obsy)*(obsz/cz4)*w
enddef;

color fillcolor; fillcolor = opgreen;
picture alphapict_;
fgalpha := 0.5;
bgalpha := 0.5;

vardef alphafill expr c =
  alphapict_ := nullpicture;
  _alphafill_(currentpicture, c);
  addto currentpicture also alphapict_;
enddef;

def _alphafill_(expr p, c) =
  begingroup
    save p_, xmax_, xmin_, ymax_, ymin_; picture p_;
    p_ = nullpicture;
    (xmin_, ymin_) = llcorner c; (xmax_, ymax_) = urcorner c;
    addto p_ contour c withcolor bgalpha[background,fillcolor];
    for p__ within p:
      numeric xmin__, xmax__, ymin__, ymax__;
      (xmin__, ymin__) = llcorner p__; (xmax__, ymax__) = urcorner p__;
      if (xmax__<= xmin_) or (xmin__ >= xmax_):
      else:
        if (ymax__<= ymin_) or (ymin__ >= ymax_):
        else:
          if (not clipped p__) and (not bounded p__):
            addto p_ also p__ withcolor
            fgalpha[(redpart p__, greenpart p__, bluepart p__),
            fillcolor];
          else:
            begingroup save alphapict_;
              picture alphapict_; alphapict_ = nullpicture;
              _alphafill_(p__, pathpart p__);
              addto p_ also alphapict_;
            endgroup;
          fi
        fi
      fi
    endfor
    clip p_ to c;
    addto alphapict_ also p_;
  endgroup;
enddef;
