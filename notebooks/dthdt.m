function [tend, K, Fth] = dthdt(t,theta,flag,zf,zh,l,Fth0)

%  theta tendency for ODE solver used to calculate deepening of surf-heated BL.
%  Arguments   Size   Units  Description
%    t          1       s    time
%    theta     nzx1     K    at half-levels zh (here nz is length of zh)
%    flag                    must be set to ''
%  Parameters
%    zf      (nz+1)x1   m    height of flux levels
%    zh          nzx1   m    height of half (thermo) levels
%    l       (nz-1)x1   m    Blackadar lengthscale at heights z(2)-z(nz)
%    Fth0         1   K m/s  Constant surface theta flux
%  Output 
%    tend        nzx1   m    tendency d(theta)/dt at the half-levels
%    K       (nz-1)x1  m2/s  eddy diffusivity at interior flux levels
%    Fth     (nz+1)x1 K m/s  theta flux at flux levels  

  nz = length(zh);
  g = 9.8;
  thetaref = mean(theta);
  dthdz = diff(theta)./diff(zh);

%  We use the convective limit (Ri -> inf) of eddy diffusivity formula
%   K = l^2*|du/dz|*sqrt(1-16Ri) ~ l^2*sqrt(-16*db/dz) (unstable)
%  We take K=0 for stable stratification.

  dbdz = (g/thetaref)*dthdz;
  dbdz(dbdz>0) = 0;
  K = l.^2.*sqrt(-16*dbdz);
  Fth(2:nz,1) = -K.*dthdz;
  Fth(1) = Fth0;
  Fth(nz+1) = 0;
  tend = -diff(Fth)./diff(zf);

%--------------------------------------------------------------


  

  


