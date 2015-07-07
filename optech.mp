%
% optech.mp - Shared MetaPost files for OpenPave Technical docs
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

newinternal pi; pi := 3.141592654;
newinternal sqrttwopi; sqrttwopi := 2.506628275;

vardef exp primary x = mexp(256x) enddef;
vardef ln primary x = mlog(x)/256 enddef;
vardef log primary x = mlog(x)/589.46178 enddef;

newinternal accuracy; accuracy := 0.00001;

vardef bisectionsolve(expr formula, lowerbound, upperbound) =
  save f, lb_, ub_, lf_, uf_, mf_;
  scantokens("vardef f(expr x) = " & formula & " enddef;");
  lb_ = lowerbound; ub_ = upperbound;
  lf_ = f(lb_); uf_ = f(ub_);
  forever:
    mf_ := f((lb_+ub_)/2);
    if ((lf_ < 0) and (mf_ >= 0)) or ((lf_ > 0) and (mf_ <= 0)):
      ub_ := (lb_+ub_)/2; uf_ := mf_;
    else:
      lb_ := (lb_+ub_)/2; lf_ := mf_;
    fi
    exitif abs(ub_-lb_) < 2accuracy;
  endfor
  (lb_+ub_)/2
enddef;

normlimit = 4;

vardef normalpdf(expr x) =
  .3989423mexp(-128x*x)
enddef;

vardef normalcdf primary x =
  if abs x < normlimit:
    if x = 0:
      0.5
    else:
      save n, u, phi;
      u = x/sqrttwopi; phi = 0.5+u; n = 0;
      forever:
	n := n+1;
	u := -u*x*x/(2n);
	phi := phi+u/(2n+1);
	exitif (n > x*x) and (abs(u/(2n+1)) < accuracy);
      endfor
      max(min(phi, 1), 0)
    fi
  else: if x < 0: 0 else: 1 fi
  fi
enddef;

vardef normalinv primary alpha =
  if alpha > 1-accuracy:
    normlimit
  elseif alpha < accuracy:
    -normlimit
  elseif alpha=0.5: 0
  else:
    save alpha_; alpha_ = alpha;
    bisectionsolve("normalcdf(x)-alpha_", -normlimit, normlimit)
  fi
enddef;

newinternal axis, lastpath;
transform axis;
path lastpath;

vardef setrange(expr xmin, xmax, xlength, ymin, ymax, ylength) =
  hmin := xmin; hmax := xmax; hsize_ := xmax-xmin; hlength_ := xlength;
  vmin := ymin; vmax := ymax; vsize_ := ymax-ymin; vlength_ := ylength;
  axis := identity xscaled(1/hsize_) yscaled(1/vsize_);
  axis := axis xscaled xlength yscaled ylength;
enddef;

vardef plot(expr formula, xmin, xmax, nstep) =
  noplot(formula, xmin, xmax, nstep); draw lastpath
enddef;

vardef noplot(expr formula, xmin, xmax, nstep) =
  scantokens("vardef _plot_(expr x) = " & formula & " enddef");
  lastpath := (xmin, _plot_(xmin))
  for p_ = 1 upto nstep:
    ...((p_/nstep)[xmin, xmax], _plot_((p_/nstep)[xmin, xmax]))
  endfor;
  lastpath := lastpath transformed axis;
enddef;

vardef plotnormal(expr mu, sigma, xmin, xmax, nstep) =
  _mu_ := mu; _sigma_ := sigma;
  plot("mexp(-128*(((x-_mu_)/_sigma_)**2))/sqrttwopi/_sigma_",
    xmin, xmax, nstep)
enddef;

def normalcontour(expr c, ux, uy, sx, sy, p) =
  unitcircle shifted(-0.5,-0.5) scaled(2*c)
    xscaled(sqrt(1+p)) yscaled(sqrt(1-p)) rotated(45) xscaled(sx) yscaled(sy) shifted(ux,uy) 
enddef;

vardef normallabel(expr c, ux, uy, sx, sy, p) =
  (c*(1+p)/sqrt(2),c*(1-p)/sqrt(2)) rotated(45) xscaled(sx) yscaled(sy) shifted(ux,uy)
enddef;

color fillcolor; fillcolor = opgreen;
picture alphapict_;
alpha := 0.5;

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
    addto p_ contour c withcolor alpha[background,fillcolor];
    for p__ within p:
      numeric xmin__, xmax__, ymin__, ymax__;
      (xmin__, ymin__) = llcorner p__; (xmax__, ymax__) = urcorner p__;
      if (xmax__<= xmin_) or (xmin__ >= xmax_):
      else:
        if (ymax__<= ymin_) or (ymin__ >= ymax_):
        else:
          if (not clipped p__) and (not bounded p__):
            addto p_ also p__ withcolor
            alpha[(redpart p__, greenpart p__, bluepart p__),
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

vardef unitdir primary p =
  save cx, cy, cz, l; numeric cx, cy, cz, l;
  cx := redpart p; cy := greenpart p; cz := bluepart p;
  l := abs(cx)+abs(cy)+abs(cz);
  if l > 0:
    cx := cx/l; cy := cy/l; cz := cz/l;
    l := sqrt(cx*cx+cy*cy+cz*cz);
    (cx/l, cy/l, cz/l)
  else:
    (cx, cy, cz)
  fi  
enddef;

numeric cameraang; cameraang := 52;
numeric camerainc; camerainc := 25;
numeric camerarot; camerarot := 0;
numeric cameradis; cameradis := 6;
numeric obsx; obsx := 0;
numeric obsy; obsy := 0;
numeric obsz; obsz := 1;

vardef global(expr x, y, z) =
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

  cx4 :=  cosd(-90-camerarot)*cx3+sind(-90-camerarot)*cy3;
  cy4 := -sind(-90-camerarot)*cx3+cosd(-90-camerarot)*cy3;
  cz4 :=  cz3;

  (cx4, cy4, cz4)
enddef;

vardef camera =
  cameradis*(sind(90-camerainc)*cosd(cameraang),
             sind(90-camerainc)*sind(cameraang),
             cosd(90-camerainc)
enddef;

vardef globaldir primary p =
  % Camera x,y,z;
  numeric cx[];
  numeric cy[];
  numeric cz[];
  cx1 :=   redpart p;
  cy1 := greenpart p;
  cz1 :=  bluepart p;
  
  % Camera rotation.
  cx2 :=  cosd(cameraang)*cx1+sind(cameraang)*cy1;
  cy2 := -sind(cameraang)*cx1+cosd(cameraang)*cy1;
  cz2 :=  cz1;

  cx3 :=  cosd(90-camerainc)*cx2-sind(90-camerainc)*cz2;
  cy3 :=  cy2;
  cz3 :=  sind(90-camerainc)*cx2+cosd(90-camerainc)*cz2;

  cx4 :=  cosd(-90-camerarot)*cx3+sind(-90-camerarot)*cy3;
  cy4 := -sind(-90-camerarot)*cx3+cosd(-90-camerarot)*cy3;
  cz4 :=  cz3;

  (cx4, cy4, cz4)
enddef;

vardef perspect(expr x, y, z) =
  save g; color g; g := global(x,y,z);
  (obsx,obsy)+w*(redpart g, greenpart g)*(obsz/(bluepart g))
enddef;

vardef dirtoobs(expr p) =
  unitdir(-global(redpart p, greenpart p, bluepart p))
enddef;

newinternal lightsource; color lightsource; lightsource := (1,1,0);

vardef dirtolight(expr p) =
  unitdir(global(redpart lightsource, greenpart lightsource,
    bluepart lightsource) - global(redpart p, greenpart p, bluepart p))
enddef;

vardef qsort(expr pivot)(text remainder) =
  save maxlist, minlist, maxcard, mincard, p_; maxcard = mincard = 0;
  for p_ = remainder:
    if (bluepart global(redpart pivot, greenpart pivot, bluepart pivot))
     >= (bluepart global(redpart p_, greenpart p_, bluepart p_)):
      if maxcard > 0: expandafter def expandafter maxlist expandafter =
	  maxlist, p_ enddef; else: def maxlist = p_ enddef; fi
      maxcard := maxcard+1;
    else:
      if mincard > 0: expandafter def expandafter minlist expandafter =
	  minlist, p_ enddef; else: def minlist = p_ enddef; fi
      mincard := mincard+1;
    fi
  endfor
  if maxcard > 1: qsort(maxlist); let maxlist = qsortlist; fi
  if mincard > 1: qsort(minlist); let minlist = qsortlist; fi
  if maxcard > 0: expandafter def expandafter qsortlist expandafter =
      maxlist, pivot enddef;
  else: def qsortlist = pivot enddef; fi
  if mincard > 0: expandafter def expandafter qsortlist expandafter =
      qsortlist, enddef;
    expandafter expandafter expandafter def
      expandafter expandafter expandafter qsortlist
      expandafter expandafter expandafter =
      expandafter qsortlist minlist enddef; fi
enddef;

newinternal PenColor, ObjectColor, ObjectOpacity;
color PenColor;    PenColor := black;
color ObjectColor; ObjectColor := 0.75white;
numeric ObjectOpacity; ObjectOpacity := 0.7;

primarydef u dotprod v =
  (redpart u * redpart v + greenpart u * greenpart v + bluepart u * bluepart v)
enddef;

vardef light(expr p, d, c) =
  save l, g; color l, g; l := dirtolight(p); g := globaldir(d);
  save o, b, w; numeric o, b, w; o := (l dotprod g);
  b := 1*(0.5*(1+o)[0.5,1]);
  w := 0.2*(min(max(0,(2*o*g-l) dotprod dirtoobs(p)),1)**3);
  %b := round(b*64)/64; w := round(w*32)/32;
  w[b[black,c],white]
enddef;

vardef patch(text t) =
  save x_, y_, z_, m, d, p; color m, d; path p;
  save s, c; numeric s; numeric x_, y_, z_, c;
  c:=0;x_:=0;y_:=0;z_:=0;
  forsuffixes #=t:
   c:=c+1; s:=#;
   x_:=x_+x#; y_:=y_+y#; z_:=z_+z#;
   if c=1: p := perspect(x#,y#,z#);
   else: p := p--perspect(x#,y#,z#); fi;
  endfor;
  p := p--cycle;
  m := (x_/c,y_/c,z_/c);
  x_:=0;y_:=0;z_:=0;
  forsuffixes #=t:
   x_:=x_+y[s]*z#-z[s]*y#;
   y_:=y_+z[s]*x#-x[s]*z#;
   z_:=z_+x[s]*y#-y[s]*x#;
   s:=#;
  endfor;
  d := unitdir(x_,y_,z_);
  %fill p withcolor transparent(1,ObjectOpacity,light(m,d,ObjectColor));
  if turningnumber(p)>=0:
  	fill p withcolor light(m,d,ObjectColor);
  else:
   fill p withcolor light(m,-d,ObjectColor);
  fi;
  %draw p withcolor PenColor;
enddef;

vardef splot(expr formula, xmin, xmax, ymin, ymax) =
  save x, y, z, a, f, nx, ny, p_; a = 0; path p_;

  scantokens("vardef f(expr x, y) ="& formula &" enddef;");
  qsort((xmin,ymin,0),(xmin,ymax,0),(xmax,ymin,0),(xmax,ymax,0));
  for p_ = qsortlist:
    a := a+1; x[a] = redpart p_; y[a] = greenpart p_; z[a] = bluepart p_;
  endfor
  p_ := perspect(x1,y1,z1)--perspect(x2,y2,z2)
   --perspect(x3,y3,z3)--perspect(x4,y4,z4)--cycle;
  if turningnumber(p_) < 0: x5 := x2; y5 := y2; z5 := z2;
    x2 := x3; y2 := y3; z2 := z3; x3 := x5; y3 := y5; z3 := z5; fi
  nx = 30; ny = 30;
  for i = 1 upto nx:
    for j = 1 upto ny:
      x5 := ((i-1)/nx)[((j-1)/ny)[x1, x2], ((j-1)/ny)[x3, x4]];
      x6 := ((i-1)/nx)[(    j/ny)[x1, x2], (    j/ny)[x3, x4]];
      x7 := (    i/nx)[((j-1)/ny)[x1, x2], ((j-1)/ny)[x3, x4]];
      x8 := (    i/nx)[(    j/ny)[x1, x2], (    j/ny)[x3, x4]];
      y5 := ((i-1)/nx)[((j-1)/ny)[y1, y2], ((j-1)/ny)[y3, y4]];
      y6 := ((i-1)/nx)[(    j/ny)[y1, y2], (    j/ny)[y3, y4]];
      y7 := (    i/nx)[((j-1)/ny)[y1, y2], ((j-1)/ny)[y3, y4]];
      y8 := (    i/nx)[(    j/ny)[y1, y2], (    j/ny)[y3, y4]];
      z5 := f(x5, y5); z6 := f(x6, y6); z7 := f(x7, y7); z8 := f(x8, y8);
      x9 := 0.5[0.5[x5, x6],0.5[x7, x8]];
      y9 := 0.5[0.5[y5, y6],0.5[y7, y8]];
      z9 := f(x9, y9);
      patch(5,6,8,7);
      %draw perspect(x5,y5,z5)--perspect(x6,y6,z6)
      %  --perspect(x8,y8,z8)--perspect(x7,y7,z7)--cycle
      %    withcolor PenColor;
    endfor
  endfor
enddef;

vardef binormal(expr ux, uy, sx, sy, p, x, y) =
  1/(2*pi*sx*sy*sqrt(1-p**2)) *
    exp(-1/(2*(1-p**2))*(((x-ux)**2)/(sx**2)
      +((y-uy)**2)/(sy**2)-2*p*(x-ux)*(y-uy)/(sx*sy)))
enddef;

vardef splotnormal(expr ux, uy, sx, sy, cc,
        xmin, xmax, ymin, ymax, nx, ny, zscale) =
  save x, y, z, a, p_, j_; path p_;
  save fail, safe; color fail, safe;
  fail := 0.5[red,white]; safe := 0.8[green,white];

  x1:=xmin;y1:=ymin;x2:=xmin;y2:=ymax;
  x3:=xmax;y3:=ymin;x4:=xmax;y4:=ymax;
  for a = 1 upto 4:
    for # = 3 downto 1:
      save cl, cr; color cl, cr;
      cl := global(x[#],y[#],0); cr := global(x[#+1],y[#+1],0);
      if ((bluepart cl > bluepart cr)
       or ((bluepart cl = bluepart cr) and (redpart cl > redpart cr))):
        x5:=x[#+1];y5:=y[#+1];x[#+1]:=x[#];y[#+1]:=y[#];x[#]:=x5;y[#]:=y5;
      fi
    endfor
  endfor
  p_ := perspect(x1,y1,0)--perspect(x2,y2,0)
   --perspect(x3,y3,0)--perspect(x4,y4,0)--cycle;
  if turningnumber(p_) < 0:
   x5:=x2;y5:=y2;x2:=x3;y2:=y3;x3:=x5;y3:=y5; fi
  for i = 1 upto nx:
    for j = 1 upto ny:
      x5 := ((i-1)/nx)[((j-1)/ny)[x1, x2], ((j-1)/ny)[x3, x4]];
      x6 := ((i-1)/nx)[(    j/ny)[x1, x2], (    j/ny)[x3, x4]];
      x7 := (    i/nx)[((j-1)/ny)[x1, x2], ((j-1)/ny)[x3, x4]];
      x8 := (    i/nx)[(    j/ny)[x1, x2], (    j/ny)[x3, x4]];
      y5 := ((i-1)/nx)[((j-1)/ny)[y1, y2], ((j-1)/ny)[y3, y4]];
      y6 := ((i-1)/nx)[(    j/ny)[y1, y2], (    j/ny)[y3, y4]];
      y7 := (    i/nx)[((j-1)/ny)[y1, y2], ((j-1)/ny)[y3, y4]];
      y8 := (    i/nx)[(    j/ny)[y1, y2], (    j/ny)[y3, y4]];
      z5 := zscale*binormal(ux, uy, sx, sy, cc, x5, y5);
      z6 := zscale*binormal(ux, uy, sx, sy, cc, x6, y6);
      z7 := zscale*binormal(ux, uy, sx, sy, cc, x7, y7);
      z8 := zscale*binormal(ux, uy, sx, sy, cc, x8, y8);
      %x9 := 0.5[0.5[x5, x6],0.5[x7, x8]];
      %y9 := 0.5[0.5[y5, y6],0.5[y7, y8]];
      %z9 := zscale*binormal(ux, uy, sx, sy, cc, x9, y9);
      %patch(5,6,9);
      %patch(6,8,9);
      %patch(8,7,9);
      %patch(7,5,9);
      %patch(5,6,8,7);
      if (((x1=xmin) and (y1=ymin)) or ((x1=xmax) and (y1=ymax))):
        if y5<x5:     ObjectColor := fail; patch(5,6,8); patch(8,7,5);
        elseif y5>x5: ObjectColor := safe; patch(5,6,8); patch(8,7,5);
        else:
          if (x2<x3):
            ObjectColor := safe; patch(5,6,8);
            ObjectColor := fail; patch(8,7,5);
          else:
            ObjectColor := safe; patch(8,7,5);
            ObjectColor := fail; patch(5,6,8);
          fi
          %fill perspect(x5,y5,z5)--perspect(x8,y8,z8)
          % --perspect(x8,y8,0)--perspect(x5,y5,0)--cycle
          %   withcolor transparent(1,ObjectOpacity,PenColor);
          draw perspect(x5,y5,z5)--perspect(x8,y8,z8) withcolor PenColor;
        fi;
      else:
        if y6<>x6:
          if y6<x6: ObjectColor := fail;
          else:     ObjectColor := safe;
          fi;
          if ((x1=xmax) and (y1=ymin)):
            patch(6,5,7); patch(7,8,6);
          else:
            patch(7,8,6); patch(6,5,7);
          fi
        else:
          if ((x1=xmax) and (y1=ymin)):
            ObjectColor := fail; patch(6,5,7);
            ObjectColor := safe; patch(7,8,6);
          else:
            ObjectColor := fail; patch(7,8,6);
            ObjectColor := safe; patch(6,5,7);
          fi
          %fill perspect(x6,y6,z6)--perspect(x7,y7,z7)
          % --perspect(x6,y6,0)--perspect(x7,y7,0)--cycle
          %   withcolor transparent(1,ObjectOpacity,PenColor);
          draw perspect(x6,y6,z6)--perspect(x7,y7,z7) withcolor PenColor;
        fi;
      fi;
      %draw perspect(x5,y5,z5)--perspect(x6,y6,z6)
      %  --perspect(x8,y8,z8)--perspect(x7,y7,z7)--cycle
      %    withcolor PenColor;
    endfor
  endfor

  pickup pencircle scaled 0.13mm;
  p_ := perspect(xmin,ymin,zscale*normalpdf((xmin-ux)/sx));
  for # = 1 upto nx:
    p_ := p_--perspect((#/nx)[xmin,xmax],ymin,
                zscale*normalpdf(((#/nx)[xmin,xmax]-ux)/sx));
  endfor;
  fill perspect(xmin,ymin,0)--p_--perspect(xmax,ymin,0)--cycle
    withcolor transparent(1,0.5,0.5[blue,white]);
  draw p_ withcolor black;
  p_ := perspect(xmin,ymin,zscale*normalpdf((ymin-uy)/sy));
  for # = 1 upto ny:
    p_ := p_--perspect(xmin,(#/ny)[ymin,ymax],
                zscale*normalpdf(((#/ny)[ymin,ymax]-uy)/sy));
  endfor;
  fill perspect(xmin,ymin,0)--p_--perspect(xmin,ymax,0)--cycle
    withcolor transparent(1,0.5,blue);
  draw p_ withcolor black;
  
  pickup pencircle scaled 0.25mm;
  drawarrow perspect(xmin,ymin,0)--perspect(xmin,ymax*(ny+3)/ny,0);
  drawarrow perspect(xmin,ymin,0)--perspect(xmax*(nx+3)/nx,ymin,0);
  drawarrow perspect(xmin,ymin,0)
    --perspect(xmin,ymin,zscale*normalpdf(0));
enddef;
