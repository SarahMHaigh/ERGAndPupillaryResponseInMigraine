%% Pupil response from RETeval:
% random sampling rate (can't filter)
% not long in duration

% clear all
% close all


%%%%%%%%%% PhNR %%%%%%%%%%%

path = pwd;
[~, ~, RAWm] = xlsread([pwd '/OSF_PupilData.xlsx'],'PhNRMigraine','A5:DX2244');

dataM = cell2mat(RAWm);

baseline = 100;
dur = 1500;
time = -baseline:dur;

for i = 1:size(dataM,2)/2
    
    [dM, ixM] = min(abs(dataM(:,i*2-1)));
    temp = dataM(ixM-baseline:ixM+dur,i*2);
    TPhNR_MaxBaseM(i) = nanmean(dataM(1:ixM,i*2));

        base = nanmean(temp(1:baseline));
    for k = 1:length(temp)
        TPhNR_M(k,i) = temp(k);%-base;
    end
%     figure; plot(time,respM(:,i));

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
        TPhNR_Madj(k,i) = tempAdj(k);
        TPhNR_MadjBase(k,i) = tempAdj(k)-base;
    end

    TPhNR_WholeM(i) = nanmean(TPhNR_M(1:baseline+800,i));
    TPhNR_baseM(i) = nanmean(base);

    TPhNR_RawAdjM(i) = nanmean(FullTadj);
    TPhNR_WholeMadjBase(i) = nanmean(TPhNR_MadjBase(baseline:end,i));
    TPhNR_baseMadj(i) = nanmean(baseAdj);
    TPhNR_WholeMadj(i) = nanmean(TPhNR_Madj(1:baseline+800,i));
    
    clearvars temp base slide dM ixM maxT minT tempAdj baseAdj FullTadj fullT 
end

for j = 1:i/2

    PhNR_WholeM(j) = nanmean(TPhNR_WholeM(j*2-1:j*2));
    PhNR_baseM(j) = nanmean(TPhNR_baseM(j*2-1:j*2));

    PhNR_RawAdjM(j) = nanmean(TPhNR_RawAdjM(j*2-1:j*2));
    PhNR_WholeMadjBase(j) = nanmean(TPhNR_WholeMadjBase(j*2-1:j*2));
    PhNR_baseMadj(j) = nanmean(TPhNR_baseMadj(j*2-1:j*2));
    PhNR_WholeMadj(j) = nanmean(TPhNR_WholeMadj(j*2-1:j*2));

    PhNR_M(:,j) = nanmean(TPhNR_M(:,j*2-1:j*2),2);
    PhNR_MadjBase(:,j) = nanmean(TPhNR_MadjBase(:,j*2-1:j*2),2);
    PhNR_Madj(:,j) = nanmean(TPhNR_Madj(:,j*2-1:j*2),2);

end

clearvars dataM RAWm TPhNR_WholeM TPhNR_baseM TPhNR_RawAdjM TPhNR_WholeMadjBase...
    TPhNR_baseMadj TPhNR_WholeMadj TPhNR_M TPhNR_MadjBase TPhNR_Madj

%%%

[~, ~, RAWhf] = xlsread([pwd '/OSF_PupilData.xlsx'],'PhNRHF','A5:CR2567');

dataHF = cell2mat(RAWhf);

for i = 1:size(dataHF,2)/2
    
    [dHF, ixHF] = min(abs(dataHF(:,i*2-1)));
    temp = dataHF(ixHF-baseline:ixHF+dur,i*2);
    TPhNR_MaxBaseHF(i) = nanmean(dataHF(1:ixHF,i*2));

    base = nanmean(temp(1:baseline));    
    for k = 1:length(temp)
        TPhNR_HF(k,i) = temp(k);%-base;
    end
   
%     figure; plot(time,respHF(:,i));
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
     TPhNR_MaxBaseHFadj(i) = nanmean(FullTadj(1:ixHF));

    baseAdj = nanmean(tempAdj(1:baseline));
    for k = 1:length(tempAdj)
        TPhNR_HFadj(k,i) = tempAdj(k);
        TPhNR_HFadjBase(k,i) = tempAdj(k)-base;
    end

    TPhNR_WholeHF(i) = nanmean(TPhNR_HF(1:baseline+800,i));
    TPhNR_baseHF(i) = nanmean(base);

    TPhNR_RawAdjHF(i) = nanmean(FullTadj);
    TPhNR_WholeHFadjBase(i) = nanmean(TPhNR_HFadjBase(baseline:end,i));
    TPhNR_WholeHFadj(i) = nanmean(TPhNR_HFadj(1:baseline+800,i));
    TPhNR_baseHFadj(i) = nanmean(baseAdj);
    
    clearvars temp base slide dM ixM maxT minT tempAdj baseAdj FullTadj fullT
end

for j = 1:i/2

    PhNR_WholeHF(j) = nanmean(TPhNR_WholeHF(j*2-1:j*2));
    PhNR_baseHF(j) = nanmean(TPhNR_baseHF(j*2-1:j*2));

    PhNR_RawAdjHF(j) = nanmean(TPhNR_RawAdjHF(j*2-1:j*2));
    PhNR_WholeHFadjBase(j) = nanmean(TPhNR_WholeHFadjBase(j*2-1:j*2));
    PhNR_baseHFadj(j) = nanmean(TPhNR_baseHFadj(j*2-1:j*2));
    PhNR_WholeHFadj(j) = nanmean(TPhNR_WholeHFadj(j*2-1:j*2));

    PhNR_HF(:,j) = nanmean(TPhNR_HF(:,j*2-1:j*2),2);
    PhNR_HFadjBase(:,j) = nanmean(TPhNR_HFadjBase(:,j*2-1:j*2),2);
    PhNR_HFadj(:,j) = nanmean(TPhNR_HFadj(:,j*2-1:j*2),2);

end

clearvars datHF RAWhf TPhNR_WholeHF TPhNR_baseHF TPhNR_RawAdjHF TPhNR_WholeHFadjBase...
    TPhNR_baseHFadj TPhNR_WholeHFadj TPhNR_HF TPhNR_HFadjBase TPhNR_HFadj
clearvars time dur baseline timeM timeHF