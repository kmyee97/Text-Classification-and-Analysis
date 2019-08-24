posFolder = '../Data/pos';
negFolder = '../Data/neg';



files = dir(fullfile(posFolder,'*.txt'));

feat = [];
label = [];
for file = files'
    sent_score = sentimentalAnalysis(fullfile(posFolder,file.name));
    display(strcat('Groundtruth:Positive, sentimental score:', num2str(sent_score)));
end

files = dir(fullfile(negFolder,'*.txt'));

for file = files'
    sent_score = sentimentalAnalysis(fullfile(negFolder,file.name));
    display(strcat('Groundtruth:Negtive, sentimental score:', num2str(sent_score)));
end