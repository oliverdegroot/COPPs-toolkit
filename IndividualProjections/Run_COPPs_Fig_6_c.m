%% ########################################################################
%% ################ Constrained Optimal Policy Projections ################
%% ########################################################################
%
% **de Groot, O., F. Mazelis, R. Motto, A. Ristiniemi**
% "A Toolkit for Computing Constrained Optimal Policy Projections (COPPs)"
% This  version: 1.0
%__________________________________________________________________________
%% ########################################################################
%% ##################             Preamble               ##################
%% ########################################################################
%% 
clear;
clc;

% Add toolkit to matlab path 
addpath('..\Toolkit');

%% ########################################################################
%% ##################        Required user input         ##################
%% ########################################################################
%% 

% Model details
params.ModelDirectory         = '..\Models\GaliNK3_ZLB';
params.ModelFilename          = 'NK3ZLB';
params.PlannerDiscountFactor  = 'betta';

% Target variables and policy variables
params.LossFunctionVariables       = {'pinf';'og'};
params.PolicyInstrumentsAndShocks  = {'r','er'};

% Timeseries
params.PastPeriods                  = 50;  

%% ########################################################################
%% ##################        Optional user input         ##################
%% ########################################################################
%%
% Forward guidance
params.alpha = 0;

params.T_loss   = 60;
params.H_policy = 60;

params.Constraint     = 'ON';
params.RateMin        = 0;        % ELB in annual policy rate
params.PolicyRateStSt = 0;

siggma = 1;
varphi = 5;
theta  = 3/4;
betta  = 0.99;
alppha = 1/4;
epsilon= 9;
Omega  = (1-alppha)/(1-alppha+alppha*epsilon);       %defined on page 60
lambda = (1-theta)*(1-betta*theta)/theta*Omega;      %defined on page 61
kappa  = lambda*(siggma+(varphi+alppha)/(1-alppha)); %defined on page 63
vartheta= kappa/epsilon;
alpha_x = kappa/epsilon;


params.LossFunctionWeights         = [1,alpha_x];

params.plotting.NoPlot     = 1;
params.plotting.P_future = 25; 
params.plotting.VarsToPlot = {...
    'pi_ann',[-40,5],'Inflation'  ;...
    'og'    ,[-30,5],'Output gap' ;...
    'r_ann' ,[-1,6] ,'Policy rate';...
    };


%% ########################################################################
%% #########        No user input required below this line        #########
%% ########################################################################
%% Set non-user defined values to default
params = SetRemainingParameters(params);

%% Solve for the policy projections
projections = SolveCOPPs(params);

%% Plot everything
params.plotting.P_past   = 4;
PlotCOPPs(projections, params);
