function [residual, g1, g2, g3] = Gali_2015_chapter_5_discretion_ZLB_ar1_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [nperiods by M_.exo_nbr] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   steady_state  [M_.endo_nbr by 1] double       vector of steady state values
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the dynamic model equations in order of 
%                                          declaration of the equations.
%                                          Dynare may prepend auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by #dynamic variables] double    Jacobian matrix of the dynamic model equations;
%                                                           rows: equations in order of declaration
%                                                           columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(9, 1);
Omega__ = (1-params(1))/(1-params(1)+params(1)*params(5));
lambda__ = (1-params(6))*(1-params(6)*params(2))/params(6)*Omega__;
kappa__ = lambda__*(params(3)+(params(1)+params(4))/(1-params(1)));
vartheta__ = kappa__/params(5);
T40 = 1/params(3);
lhs =y(2);
rhs =params(2)*y(11)+kappa__*y(3);
residual(1)= lhs-rhs;
lhs =y(3);
rhs =y(12)-T40*(y(4)-y(11)-y(10));
residual(2)= lhs-rhs;
lhs =y(3)*vartheta__;
rhs =y(2)*(-kappa__)-y(7);
residual(3)= lhs-rhs;
residual(4) = y(7)/params(3);
lhs =y(5);
rhs =y(10)*4;
residual(5)= lhs-rhs;
lhs =y(6);
rhs =y(2)*4;
residual(6)= lhs-rhs;
lhs =y(10);
rhs =1-params(9)+params(9)*y(1)+x(it_, 1);
residual(7)= lhs-rhs;
lhs =y(9);
rhs =max(y(4),0);
residual(8)= lhs-rhs;
lhs =y(8);
rhs =y(4)*4;
residual(9)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(9, 13);

  %
  % Jacobian matrix
  %

  g1(1,2)=1;
  g1(1,11)=(-params(2));
  g1(1,3)=(-kappa__);
  g1(2,11)=(-T40);
  g1(2,3)=1;
  g1(2,12)=(-1);
  g1(2,4)=T40;
  g1(2,10)=(-T40);
  g1(3,2)=kappa__;
  g1(3,3)=vartheta__;
  g1(3,7)=1;
  g1(4,7)=T40;
  g1(5,5)=1;
  g1(5,10)=(-4);
  g1(6,2)=(-4);
  g1(6,6)=1;
  g1(7,1)=(-params(9));
  g1(7,10)=1;
  g1(7,13)=(-1);
  g1(8,4)=(-(y(4)>0));
  g1(8,9)=1;
  g1(9,4)=(-4);
  g1(9,8)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],9,169);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],9,2197);
end
end
end
end
