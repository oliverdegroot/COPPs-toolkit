%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Save empty dates and dseries objects in memory.
dates('initialize');
dseries('initialize');
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'Gali_2015_chapter_5_discretion_ZLB_ar1';
M_.dynare_version = '4.5.7';
oo_.dynare_version = '4.5.7';
options_.dynare_version = '4.5.7';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('Gali_2015_chapter_5_discretion_ZLB_ar1.log');
M_.exo_names = 'eps_rn';
M_.exo_names_tex = 'eps\_rn';
M_.exo_names_long = 'eps_rn';
M_.endo_names = 'pi';
M_.endo_names_tex = '{\pi}';
M_.endo_names_long = 'inflation';
M_.endo_names = char(M_.endo_names, 'x');
M_.endo_names_tex = char(M_.endo_names_tex, '{x}');
M_.endo_names_long = char(M_.endo_names_long, 'welfare-relevant output gap');
M_.endo_names = char(M_.endo_names, 'i');
M_.endo_names_tex = char(M_.endo_names_tex, '{i}');
M_.endo_names_long = char(M_.endo_names_long, 'nominal interest rate');
M_.endo_names = char(M_.endo_names, 'r_nat_ann');
M_.endo_names_tex = char(M_.endo_names_tex, '{r^{nat,ann}}');
M_.endo_names_long = char(M_.endo_names_long, 'annualized natural interest rate');
M_.endo_names = char(M_.endo_names, 'pi_ann');
M_.endo_names_tex = char(M_.endo_names_tex, '{\pi^{ann}}');
M_.endo_names_long = char(M_.endo_names_long, 'annualized inflation rate');
M_.endo_names = char(M_.endo_names, 'xi_2');
M_.endo_names_tex = char(M_.endo_names_tex, '{\xi_2}');
M_.endo_names_long = char(M_.endo_names_long, 'Langrange multiplier');
M_.endo_names = char(M_.endo_names, 'i_ann');
M_.endo_names_tex = char(M_.endo_names_tex, '{i^{ann}}');
M_.endo_names_long = char(M_.endo_names_long, 'annualized nominal interest rate');
M_.endo_names = char(M_.endo_names, 'i_act');
M_.endo_names_tex = char(M_.endo_names_tex, 'i\_act');
M_.endo_names_long = char(M_.endo_names_long, 'i_act');
M_.endo_names = char(M_.endo_names, 'r_nat');
M_.endo_names_tex = char(M_.endo_names_tex, 'r\_nat');
M_.endo_names_long = char(M_.endo_names_long, 'r_nat');
M_.endo_partitions = struct();
M_.param_names = 'alppha';
M_.param_names_tex = '{\alppha}';
M_.param_names_long = 'capital share';
M_.param_names = char(M_.param_names, 'betta');
M_.param_names_tex = char(M_.param_names_tex, '{\beta}');
M_.param_names_long = char(M_.param_names_long, 'discount factor');
M_.param_names = char(M_.param_names, 'siggma');
M_.param_names_tex = char(M_.param_names_tex, '{\sigma}');
M_.param_names_long = char(M_.param_names_long, 'log utility');
M_.param_names = char(M_.param_names, 'varphi');
M_.param_names_tex = char(M_.param_names_tex, '{\varphi}');
M_.param_names_long = char(M_.param_names_long, 'unitary Frisch elasticity');
M_.param_names = char(M_.param_names, 'epsilon');
M_.param_names_tex = char(M_.param_names_tex, '{\epsilon}');
M_.param_names_long = char(M_.param_names_long, 'demand elasticity');
M_.param_names = char(M_.param_names, 'theta');
M_.param_names_tex = char(M_.param_names_tex, '{\theta}');
M_.param_names_long = char(M_.param_names_long, 'Calvo parameter');
M_.param_names = char(M_.param_names, 'phi_pi');
M_.param_names_tex = char(M_.param_names_tex, '{\phi_\pi}');
M_.param_names_long = char(M_.param_names_long, 'Taylor rule inflation feedback');
M_.param_names = char(M_.param_names, 'phi_y');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_y');
M_.param_names_long = char(M_.param_names_long, 'phi_y');
M_.param_names = char(M_.param_names, 'rho_rn');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_rn');
M_.param_names_long = char(M_.param_names_long, 'rho_rn');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 9;
M_.param_nbr = 9;
M_.orig_endo_nbr = 9;
M_.aux_vars = [];
M_.Sigma_e = zeros(1, 1);
M_.Correlation_matrix = eye(1, 1);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('Gali_2015_chapter_5_discretion_ZLB_ar1_static');
erase_compiled_function('Gali_2015_chapter_5_discretion_ZLB_ar1_dynamic');
M_.orig_eq_nbr = 9;
M_.eq_nbr = 9;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 0 2 11;
 0 3 12;
 0 4 0;
 0 5 0;
 0 6 0;
 0 7 0;
 0 8 0;
 0 9 0;
 1 10 0;]';
M_.nstatic = 6;
M_.nfwrd   = 2;
M_.npred   = 1;
M_.nboth   = 0;
M_.nsfwrd   = 2;
M_.nspred   = 1;
M_.ndynamic   = 3;
M_.equations_tags = {
  1 , 'name' , 'New Keynesian Phillips Curve eq. (29)' ;
  2 , 'name' , 'Dynamic IS Curve eq. (30)' ;
  3 , 'name' , 'FOC, eq. (33)' ;
  4 , 'name' , 'FOC w.r.t. to i' ;
  4 , 'mcp' , 'i>0' ;
  5 , 'name' , 'Annualized natural interest rate' ;
  6 , 'name' , 'Annualized inflation' ;
  8 , 'name' , 'Annualized nominal interest rate' ;
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:1];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(9, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(9, 1);
M_.NNZDerivatives = [23; 0; -1];
M_.params( 3 ) = 1;
siggma = M_.params( 3 );
M_.params( 4 ) = 5;
varphi = M_.params( 4 );
M_.params( 6 ) = 0.75;
theta = M_.params( 6 );
M_.params( 2 ) = 0.99;
betta = M_.params( 2 );
M_.params( 1 ) = 0.25;
alppha = M_.params( 1 );
M_.params( 5 ) = 9;
epsilon = M_.params( 5 );
M_.params( 7 ) = 1.5;
phi_pi = M_.params( 7 );
M_.params( 8 ) = 0.125;
phi_y = M_.params( 8 );
M_.params( 9 ) = 0.7;
rho_rn = M_.params( 9 );
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 9 ) = 1;
oo_.steady_state( 3 ) = 1;
oo_.steady_state( 7 ) = 4*oo_.steady_state(3);
oo_.steady_state( 4 ) = 4*oo_.steady_state(9);
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
steady;
%
% SHOCKS instructions
%
M_.det_shocks = [ M_.det_shocks;
struct('exo_det',0,'exo_id',1,'multiplicative',0,'periods',1:1,'value',(-6)) ];
M_.exo_det_length = 0;
options_.periods = 199;
perfect_foresight_setup;
options_.lmmcp.status = 1;
perfect_foresight_solver;
figure('Name','Discretion')
subplot(2,2,1); hold on;
plot(0:16,4*oo_.endo_simul(strmatch('pi',M_.endo_names,'exact'),M_.maximum_lag+1:M_.maximum_lag+17),'-o')
title('Inflation')
axis([0 16 -40 4])
subplot(2,2,2); hold on;
plot(0:16,oo_.endo_simul(strmatch('x',M_.endo_names,'exact'),M_.maximum_lag+1:M_.maximum_lag+17),'-o')
title('Output gap')
axis([0 16 -30 2])
subplot(2,2,3); hold on;
plot(0:16,4*oo_.endo_simul(strmatch('i',M_.endo_names,'exact'),M_.maximum_lag+1:M_.maximum_lag+17),'-o')
title('Policy rate (Ann.)')
axis([0 16 -1 5])
save('Gali_2015_chapter_5_discretion_ZLB_ar1_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('Gali_2015_chapter_5_discretion_ZLB_ar1_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('Gali_2015_chapter_5_discretion_ZLB_ar1_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('Gali_2015_chapter_5_discretion_ZLB_ar1_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('Gali_2015_chapter_5_discretion_ZLB_ar1_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('Gali_2015_chapter_5_discretion_ZLB_ar1_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('Gali_2015_chapter_5_discretion_ZLB_ar1_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
