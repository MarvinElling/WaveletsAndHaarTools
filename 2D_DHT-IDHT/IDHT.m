function c = IDHT(w,steps)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

J = length(w)/2;
c = w(1:length(w)/2);
p1 = 2^J+1;

  
p2 = p1 + length(c)-1;
% d = w(p1:p2); 
d = w(length(w)/2+1:length(w));
c = [ c+d ; c-d ]/sqrt(2);
c = c(:)';


