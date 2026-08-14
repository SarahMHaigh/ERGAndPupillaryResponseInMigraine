%% Pupil response from RETeval:
% random sampling rate (can't filter)
% not long in duration

clear all
close all

OSF_PupilConeFast
[ConeFwholeAdj_H,P,CI,STATS] = ttest2(ConeF_WholeMadj, ConeF_WholeHFadj) %ns

OSF_PupilConeSlow
[ConeSwholeAdj_H,P,CI,STATS] = ttest2(ConeS_WholeMadj, ConeS_WholeHFadj) %marginal

OSF_PupilRodBright
[RodBwholeAdj_H,P,CI,STATS] = ttest2(RodB_WholeMadj, RodB_WholeHFadj) %sig

OSF_PupilRodLow
[RodLwholeAdj_H,P,CI,STATS] = ttest2(RodL_WholeMadj, RodL_WholeHFadj) %sig

OSF_PupilPhNR
[PhNRwholeAdj_H,P,CI,STATS] = ttest2(PhNR_WholeMadj, PhNR_WholeHFadj) %ns


%% Aura Analysis %%

% OSF_PupilRodBright %sig
mo = 13;
ma = 18;
hf = 23;
group = [zeros(1,mo) ones(1,ma) ones(1,hf)*2];
RodB_FullWholeAdj = [RodB_WholeMadj RodB_WholeHFadj];
[RodB_H,tbl,STATS] = anova1(RodB_FullWholeAdj,group);
clearvars mo ma hf group

% OSF_PupilRodLow
mo = 13;
ma = 17;
hf = 23;
group = [zeros(1,mo) ones(1,ma) ones(1,hf)*2];
RodL_FullWholeAdj = [RodL_WholeMadj RodL_WholeHFadj];
[RodL_H,tbl,STATS] = anova1(RodL_FullWholeAdj,group);
clearvars mo ma hf group