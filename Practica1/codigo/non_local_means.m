function [processed_im] = non_local_means(input, window_size,sigma)

    kernel = radial_ponderation(window_size);
    kernel = kernel / sum(sum(kernel));
    
    [height width]=size(input);
    sigma = sigma*sigma;
    processed_im = zeros(height,width);
    
    
    input2 = padarray(input,[window_size window_size],'symmetric');

    for i=1:height
        for j=1:width

             i_window = i + window_size;
             j_window = j + window_size;
             current_patch= input2(i_window-window_size:i_window+window_size , j_window-window_size:j_window+window_size);
             
             max_weight=0; 
             average=0;
             accumulated_weight=0;
             [height_min, height_max, width_min, width_max] = get_window(i_window, j_window, height, width, window_size);

             for r=height_min:1:height_max
                 for s=width_min:1:width_max

                        if(r==i_window && s==j_window) 
                            continue;
                        end

                        matching_patch= input2(r-window_size:r+window_size , s-window_size:s+window_size);                
                        ssd = sum(sum(kernel.*(current_patch-matching_patch).*(current_patch-matching_patch)));
                        current_weight = exp(-ssd/sigma);                 

                        if current_weight>max_weight                
                            max_weight=current_weight;                   
                        end

                        accumulated_weight = accumulated_weight + current_weight;
                        average = average + current_weight*input2(r,s);                                  
                 end 
             end

            average = average + max_weight*input2(i_window,j_window);
            accumulated_weight = accumulated_weight + max_weight;

            if accumulated_weight > 0
                processed_im(i,j) = average / accumulated_weight;
            else
                processed_im(i,j) = input(i,j);
            end                
        end
    end
    
function [height_min, height_max, width_min, width_max] = get_window(i, j, height, width, window_size)             
    height_min = max(i-window_size,window_size+1);
    height_max = min(i+window_size,height+window_size);
    width_min = max(j-window_size,window_size+1);
    width_max = min(j+window_size,width+window_size);
    
 
function [kernel] = radial_ponderation(window_size)              
    kernel=zeros(2*window_size+1);   
    for i=1:window_size    
      value= 1 / (2*i+1)^2 ;    
      for j=-i:i
          for w=-i:i
            kernel(window_size+1-w,window_size+1-w)= kernel(window_size+1-w,window_size+1-w) + value ;
          end
      end
    end
    kernel = kernel ./ window_size;
    
    

