%% Pupil response from RETeval:
% random sampling rate (can't filter)
% not long in duration

% clear all
% close all

%%%%%%%%%% Rod - Bright Flash %%%%%%%%%%%

path = pwd;
[~, ~, RAWm] = xlsread([pwd '/OSF_PupilData.xlsx'],'0.5Migraine','A5:DP3309');

dataM = cell2mat(RAWm);

baseline = 100;
dur = 400;
% time = -baseline:dur;

for i = 1:size(dataM,2)/2
    
    [dM, ixM] = min(abs(dataM(:,i*2-1)));
    temp = dataM(ixM-baseline:ixM+dur,i*2);
    timeM(:,i) = dataM(ixM-baseline:ixM+dur,i*2-1);
    TRodL_MaxBaseM(i) = nanmean(dataM(1:ixM,i*2));

        base = nanmean(temp(1:baseline));
    for k = 1:length(temp)
        TRodL_M(k,i) = temp(k);%-base;
    end

%     figure; plot(timeM(:,i),RodL_M(:,i));

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
        TRodL_Madj(k,i) = tempAdj(k);
        TRodL_MadjBase(k,i) = tempAdj(k)-base;
    end

    TRodL_WholeM(i) = nanmean(TRodL_M(1:baseline+dur,i));
    TRodL_baseM(i) = nanmean(base);

    TRodL_RawAdjM(i) = nanmean(FullTadj);
    TRodL_WholeMadjBase(i) = nanmean(TRodL_MadjBase(baseline:end,i));
    TRodL_baseMadj(i) = nanmean(baseAdj);
    TRodL_WholeMadj(i) = nanmean(TRodL_Madj(1:baseline+dur,i));
    
    clearvars temp base slide dM ixM maxT minT tempAdj baseAdj FullTadj fullT 
end

for j = 1:i/2

    RodL_WholeM(j) = nanmean(TRodL_WholeM(j*2-1:j*2));
    RodL_baseM(j) = nanmean(TRodL_baseM(j*2-1:j*2));

    RodL_RawAdjM(j) = nanmean(TRodL_RawAdjM(j*2-1:j*2));
    RodL_WholeMadjBase(j) = nanmean(TRodL_WholeMadjBase(j*2-1:j*2));
    RodL_baseMadj(j) = nanmean(TRodL_baseMadj(j*2-1:j*2));
    RodL_WholeMadj(j) = nanmean(TRodL_WholeMadj(j*2-1:j*2));

    RodL_M(:,j) = nanmean(TRodL_M(:,j*2-1:j*2),2);
    RodL_MadjBase(:,j) = nanmean(TRodL_MadjBase(:,j*2-1:j*2),2);
    RodL_Madj(:,j) = nanmean(TRodL_Madj(:,j*2-1:j*2),2);

end

clearvars dataM RAWm TRodL_WholeM TRodL_baseM TRodL_RawAdjM TRodL_WholeMadjBase...
    TRodL_baseMadj TRodL_WholeMadj TRodL_M TRodL_MadjBase TRodL_Madj

%%%

[~, ~, RAWhf] = xlsread([pwd '/OSF_PupilData.xlsx'],'0.5HF','A5:CN3367');

dataHF = cell2mat(RAWhf);

for i = 1:size(dataHF,2)/2
    
    [dHF, ixHF] = min(abs(dataHF(:,i*2-1)));
    temp = dataHF(ixHF-baseline:ixHF+dur,i*2);
    timeHF(:,i) = dataHF(ixHF-baseline:ixHF+dur,i*2-1);
    TRodL_MaxBaseHF(i) = nanmean(dataHF(1:ixHF,i*2));

    base = nanmean(temp(1:baseline));    
    for k = 1:length(temp)
        TRodL_HF(k,i) = temp(k);%-base;
    end
   
%     figure; plot(timeHF(:,i),RodL_HF(:,i));

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
     TRodL_MaxBaseHFadj(i) = nanmean(FullTadj(1:ixHF));

    baseAdj = nanmean(tempAdj(1:baseline));
    for k = 1:length(tempAdj)
        TRodL_HFadj(k,i) = tempAdj(k);
        TRodL_HFadjBase(k,i) = tempAdj(k)-base;
    end

    TRodL_WholeHF(i) = nanmean(TRodL_HF(1:baseline+dur,i));
    TRodL_baseHF(i) = nanmean(base);

    TRodL_RawAdjHF(i) = nanmean(FullTadj);
    TRodL_WholeHFadjBase(i) = nanmean(TRodL_HFadjBase(baseline:end,i));
    TRodL_WholeHFadj(i) = nanmean(TRodL_HFadj(1:baseline+dur,i));
    TRodL_baseHFadj(i) = nanmean(baseAdj);
    
    clearvars temp base slide dM ixM maxT minT tempAdj baseAdj FullTadj fullT
end

for j = 1:i/2

    RodL_WholeHF(j) = nanmean(TRodL_WholeHF(j*2-1:j*2));
    RodL_baseHF(j) = nanmean(TRodL_baseHF(j*2-1:j*2));

    RodL_RawAdjHF(j) = nanmean(TRodL_RawAdjHF(j*2-1:j*2));
    RodL_WholeHFadjBase(j) = nanmean(TRodL_WholeHFadjBase(j*2-1:j*2));
    RodL_baseHFadj(j) = nanmean(TRodL_baseHFadj(j*2-1:j*2));
    RodL_WholeHFadj(j) = nanmean(TRodL_WholeHFadj(j*2-1:j*2));

    RodL_HF(:,j) = nanmean(TRodL_HF(:,j*2-1:j*2),2);
    RodL_HFadjBase(:,j) = nanmean(TRodL_HFadjBase(:,j*2-1:j*2),2);
    RodL_HFadj(:,j) = nanmean(TRodL_HFadj(:,j*2-1:j*2),2);

end

clearvars dataHF RAWhf TRodL_WholeHF TRodL_baseHF TRodL_RawAdjHF TRodL_WholeHFadjBase...
    TRodL_baseHFadj TRodL_WholeHFadj TRodL_HF TRodL_HFadjBase TRodL_HFadj
clearvars time dur baseline timeM timeHF