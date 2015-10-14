% Seismic Wave Propagation in viscoacoustic media
% prepare for Ms. Yao Jie for implementing her technique to Constant-Q wave equation
% Sep 20, 2015

%matlabpool open 4

% modeling parameters
[sou,rec,para,vel,rho,qp] = para_FMmodel;

% parameters
para.f_cutoff = 120;
para.taper = 0.2;

para.cq2sls = 1;
para.freq_ref_elastic = 1000;

tic
for izs = 1:15
    izs

    sc=[sou(izs,1),sou(izs,2)]; % shot position [x z]
    
    nt = para.nstep;
    para.sc=sc;para.izs = izs;
    %
    syn_data = 0;

    % running constant-Q wave equation
    FM_viscoacoustic(syn_data,vel,rho,qp,para)
  
end
toc;
%matlabpool close
