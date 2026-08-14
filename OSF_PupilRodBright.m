%% Pupil response from RETeval:
% random sampling rate (can't filter)
% not long in duration

% clear all
% close all

%%%%%%%%%% Rod - Bright Flash %%%%%%%%%%%

path = pwd;
[~, ~, RAWm] = xlsread([pwd '/OSF_PupilData.xlsx'],'0.1Migraine','A5:DT5357');

dataM = cell2mat(RAWm);

baseline = 100;
dur = 450;
% time = -baseline:dur;

for i = 1:size(dataM,2)/2
    
    [dM, ixM] = min(abs(dataM(:,i*2-1)));
    temp = dataM(ixM-baseline:ixM+dur,i*2);
    timeM(:,i) = dataM(ixM-baseline:ixM+dur,i*2-1);
    TRodB_MaxBaseM(i) = nanmean(dataM(1:ixM,i*2));

        base = nanmean(temp(1:baseline));
    for k = 1:length(temp)
        TRodB_M(k,i) = temp(k);%-base;
    end

%     figure; plot(timeM(:,i),RodB_M(:,i));

    fullT = dataM(:,i*2);
    maxT = nanmean(fullT)+(nanstd(fullT)*2);
    minT = nanmean(fullT)-(nanstd(fullT)*2);
     for j = 1:length(fullT)
        if fullT(j)>maxT || fullT(j)<minT
            FullTadj(j) = nanmean(fullT);
        else FullTadj(j) = fullT(j);
        end
     end
     tempAdj = FullTadj(ixM-baseline:ixM+dur);
     MaxBaseMadj(i) = nanmean(FullTadj(1:ixM));

    baseAdj = nanmean(tempAdj(1:baseline));
    for k = 1:length(tempAdj)
        TRodB_Madj(k,i) = tempAdj(k);
        TRodB_MadjBase(k,i) = tempAdj(k)-base;
    end

    TRodB_WholeM(i) = nanmean(TRodB_M(1:baseline+dur,i));
    TRodB_baseM(i) = nanmean(base);

    TRodB_RawAdjM(i) = nanmean(FullTadj);
    TRodB_WholeMadjBase(i) = nanmean(TRodB_MadjBase(baseline:end,i));
    TRodB_baseMadj(i) = nanmean(baseAdj);
    TRodB_WholeMadj(i) = nanmean(TRodB_Madj(1:baseline+dur,i));
    
    clearvars temp base slide dM ixM maxT minT tempAdj baseAdj FullTadj fullT 
    
end

for j = 1:i/2

    RodB_WholeM(j) = nanmean(TRodB_WholeM(j*2-1:j*2));
    RodB_baseM(j) = nanmean(TRodB_baseM(j*2-1:j*2));

    RodB_RawAdjM(j) = nanmean(TRodB_RawAdjM(j*2-1:j*2));
    RodB_WholeMadjBase(j) = nanmean(TRodB_WholeMadjBase(j*2-1:j*2));
    RodB_baseMadj(j) = nanmean(TRodB_baseMadj(j*2-1:j*2));
    RodB_WholeMadj(j) = nanmean(TRodB_WholeMadj(j*2-1:j*2));

    RodB_M(:,j) = nanmean(TRodB_M(:,j*2-1:j*2),2);
    RodB_MadjBase(:,j) = nanmean(TRodB_MadjBase(:,j*2-1:j*2),2);
    RodB_Madj(:,j) = nanmean(TRodB_Madj(:,j*2-1:j*2),2);

end

clearvars dataM RAWm TRodB_WholeM TRodB_baseM TRodB_RawAdjM TRodB_WholeMadjBase...
    TRodB_baseMadj TRodB_WholeMadj TRodB_M TRodB_MadjBase TRodB_Madj

%%%

[~, ~, RAWhf] = xlsread([pwd '/OSF_PupilData.xlsx'],'0.1HF','A5:CN3783');

dataHF = cell2mat(RAWhf);

for i = 1:size(dataHF,2)/2
    
    [dHF, ixHF] = min(abs(dataHF(:,i*2-1)));
    temp = dataHF(ixHF-baseline:ixHF+dur,i*2);
    timeHF(:,i) = dataHF(ixHF-baseline:ixHF+dur,i*2-1);
    TRodB_MaxBaseHF(i) = nanmean(dataHF(1:ixHF,i*2));

    base = nanmean(temp(1:baseline));    
    for k = 1:length(temp)
        TRodB_HF(k,i) = temp(k);%-base;
    end
   
%     figure; plot(timeHF(:,i),RodB_HF(:,i));

    fullT = dataHF(:,i*2);
    maxT = nanmean(fullT)+(nanstd(fullT)*2);
    minT = nanmean(fullT)-(nanstd(fullT)*2);
     for j = 1:length(fullT)
        if fullT(j)>maxT || fullT(j)<minT
            FullTadj(j) = nanmean(fullT);
        else FullTadj(j) = fullT(j);
        end
     end
     tempAdj = FullTadj(ixHF-baseline:ixHF+dur);
     TRodB_MaxBaseHFadj(i) = nanmean(FullTadj(1:ixHF));

    baseAdj = nanmean(tempAdj(1:baseline));
    for k = 1:length(tempAdj)
        TRodB_HFadj(k,i) = tempAdj(k);
        TRodB_HFadjBase(k,i) = tempAdj(k)-base;
    end

    TRodB_WholeHF(i) = nanmean(TRodB_HF(1:baseline+dur,i));
    TRodB_baseHF(i) = nanmean(base);

    TRodB_RawAdjHF(i) = nanmean(FullTadj);
    TRodB_WholeHFadjBase(i) = nanmean(TRodB_HFadjBase(baseline:end,i));
    TRodB_WholeHFadj(i) = nanmean(TRodB_HFadj(1:baseline+dur,i));
    TRodB_baseHFadj(i) = nanmean(baseAdj);
    
    clearvars temp base slide dM ixM maxT minT tempAdj baseAdj FullTadj fullT
end

for j = 1:i/2

    RodB_WholeHF(j) = nanmean(TRodB_WholeHF(j*2-1:j*2));
    RodB_baseHF(j) = nanmean(TRodB_baseHF(j*2-1:j*2));

    RodB_RawAdjHF(j) = nanmean(TRodB_RawAdjHF(j*2-1:j*2));
    RodB_WholeHFadjBase(j) = nanmean(TRodB_WholeHFadjBase(j*2-1:j*2));
    RodB_baseHFadj(j) = nanmean(TRodB_baseHFadj(j*2-1:j*2));
    RodB_WholeHFadj(j) = nanmean(TRodB_WholeHFadj(j*2-1:j*2));

    RodB_HF(:,j) = nanmean(TRodB_HF(:,j*2-1:j*2),2);
    RodB_HFadjBase(:,j) = nanmean(TRodB_HFadjBase(:,j*2-1:j*2),2);
    RodB_HFadj(:,j) = nanmean(TRodB_HFadj(:,j*2-1:j*2),2);

end

clearvars dataHF RAWhf TRodB_WholeHF TRodB_baseHF TRodB_RawAdjHF TRodB_WholeHFadjBase...
    TRodB_baseHFadj TRodB_WholeHFadj TRodB_HF TRodB_HFadjBase TRodB_HFadj
clearvars time dur baseline timeM timeHF
