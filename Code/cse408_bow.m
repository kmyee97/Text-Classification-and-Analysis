% function to create a vocabulary from multiple text files under folders

function feat_vec = cse408_bow(filepath, voc)
[fid, msg] = fopen(filepath, 'rt');
error(msg);
line = fgets(fid); % Get the first line from
 % the file.
feat_vec = zeros(size(voc)); %Initialize the feature vector'

while line ~= -1
    %PUT YOUR IMPLEMENTATION HERE
    replace = '[^.,!]';
    after = regexp(line,replace);
    line = line(after);
    count = 0;
    [token,remain]= strtok(line);
    temp = ismember(lower(token), voc);
        if temp == 1
          temp2 = ismember(voc(1,:), lower(token));
         
          for i=1:length(temp2)
              if temp2(i) ~=0
                  count = i;
              end
          end
          feat_vec(count) = feat_vec(count) + 1;
        end
    line = remain;
end
fclose(fid);