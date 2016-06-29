function out = waveletsPeakDetect(sig)

% Input magnitude of acc
% Output - locs points


if isempty(sig) ~= 1
    
    dats = sig;
    
    % Analysis
    y_out = [];
    for j=1:3
        [C,L] = wavedec(dats,j,'db5');
        switch j
            case 1
                th = 1/5*max(C);
            case 2
                th = 1/4*max(C);
            case 3
                th = 1/3*max(C);
        end
        C(C < th) = 0;
        y = waverec(C,L,'db5');
        y_out = [y_out y];
        
        
    end
    Y = 5*y_out(:,1) + 4*y_out(:,1) + 3*y_out(:,1);
    [pks lcs] = findpeaks(Y,'minpeakheight',mean(Y),'minpeakdistance',round(100/3));
    out = lcs;
    %     subplot(5,2,[9 10]);plot(Y);axis tight;hold on;plot(lcs,pks,'r*');
    %
    %     %         pnam = 'E:\ADSP\Analysis\Figs\';
    %     %         nam = [pnam num2str(i) '.png'];
    %     %         saveas(f, nam);
    %     %         close all
    %     pause
    
end