function  O = state_machine(M,T,L)

%M - nedvessegtartalom
%T - homerseklet
%L - fenyintenziitas
%O - öntözés 

%Allapot ST0
    if (T == 1  || L == 1) && (M <= 3) 
         O=1;
    else if (T == 0 && L ==0) && (M <= 3)
            O=1;
        else O=0;
        end        
    return;
    end
    
%Allapot ST1
    if (M >=7)  
        O=0; 
    else if (M >= 3) && (T == 1 || L = 1) 
             O=0; 
        else  O=1;
        end
        
    return;
    end
        
%Allapot ST2
	O=0; 


end

