function [residual, g1, g2, g3] = Gali_2015_chapter_5_discretion_ZLB_ar1_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Inputs : 
%   y         [M_.endo_nbr by 1] double    vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1] double     vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1] double   vector of parameter values in declaration order
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the static model equations 
%                                          in order of declaration of the equations.
%                                          Dynare may prepend or append auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by M_.endo_nbr] double    Jacobian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g3        [M_.endo_nbr by (M_.endo_nbr)^3] double   Third derivatives matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 9, 1);

%
% Model equations
%

Omega__ = (1-params(1))/(1-params(1)+params(1)*params(5));
lambda__ = (1-params(6))*(1-params(6)*params(2))/params(6)*Omega__;
kappa__ = lambda__*(params(3)+(params(1)+params(4))/(1-params(1)));
vartheta__ = kappa__/params(5);
T38 = 1/params(3);
lhs =y(1);
rhs =params(2)*y(1)+kappa__*y(2);
residual(1)= lhs-rhs;
lhs =y(2);
rhs =y(2)-T38*(y(3)-y(1)-y(9));
residual(2)= lhs-rhs;
lhs =y(2)*vartheta__;
rhs =y(1)*(-kappa__)-y(6);
residual(3)= lhs-rhs;
residual(4) = y(6)/params(3);
lhs =y(4);
rhs =y(9)*4;
residual(5)= lhs-rhs;
lhs =y(5);
rhs =y(1)*4;
residual(6)= lhs-rhs;
lhs =y(9);
rhs =1-params(9)+y(9)*params(9)+x(1);
residual(7)= lhs-rhs;
lhs =y(8);
rhs =max(y(3),0);
residual(8)= lhs-rhs;
lhs =y(7);
rhs =y(3)*4;
residual(9)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(9, 9);

  %
  % Jacobian matrix
  %

  g1(1,1)=1-params(2);
  g1(1,2)=(-kappa__);
  g1(2,1)=(-T38);
  g1(2,3)=T38;
  g1(2,9)=(-T38);
  g1(3,1)=kappa__;
  g1(3,2)=vartheta__;
  g1(3,6)=1;
  g1(4,6)=T38;
  g1(5,4)=1;
  g1(5,9)=(-4);
  g1(6,1)=(-4);
  g1(6,5)=1;
  g1(7,9)=1-params(9);
  g1(8,3)=(-(y(3)>0));
  g1(8,8)=1;
  g1(9,3)=(-4);
  g1(9,7)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],9,81);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],9,729);
end
end
end
end
