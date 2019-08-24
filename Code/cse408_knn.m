% function to run KNN classification

function pred_label = cse408_knn(test_feat, train_label, train_feat, k, DstType)


% changed the 1st one
% ^ 
if DstType == 1 %SSD
    %PUT YOUR CODE HERE
    summ =  0;
    for i=1:length(test_feat)
        summ = summ + (train_feat(i,:)-test_feat(i,:)).^2;
    end
    dist = summ;
    
elseif DstType == 2 %Angle Between Vectors
    %PUT YOUR CODE HERE 
    
    s3 = sqrt(sum(test_feat));
    train_feat = transpose(train_feat);
    summa = 0;
    train_feat = transpose(train_feat);
    for p = 1:length(train_feat)
        summa = summa + sum(train_feat(p,:)); 
    end
    summa = sqrt(summa);
    s4 = summa;
    train_feat = transpose(train_feat);
    s2 = 0;
    test_feat = transpose(test_feat);
    for i=1:length(test_feat)
        s2 = s2 + (train_feat(:,i)*test_feat(:,i));
    end
    the_angle = (s2/(s3*s4));
    dist = the_angle;
elseif DstType == 3 %Number of words in common
    %PUT YOUR CODE HERE 
    %dist = sum(min(train_feat, repmat(test_feat, size(train_feat,3),1)));
    dist = sum(min(train_feat, repmat(test_feat, size(train_feat,2),1)));
    dist = -dist; % Why minus?
end



%Find the top k nearest neighbors, and do the voting. 

[B,I] = sort(dist);

posCt=0;
negCt=0;
for ii = 1:k
    if train_label(I(ii)) == 1
        posCt = posCt + 1;
    elseif train_label(I(ii)) == 0
        negCt = negCt + 1;
    end    
end

if posCt >= negCt
    pred_label = 1;
else
    pred_label = 0;
end