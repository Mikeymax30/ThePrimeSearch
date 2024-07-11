
clc, clearvars;
elementCheck = 2;
loop = 1;
Subprimes = [2, 3];

TestMe = sqrt((((1:100) .* 24) + 1)); %basic 
PrimeSuspects = TestMe(floor(TestMe) == TestMe); %remove all non-integers
FPC = sqrt(PrimeSuspects);%sqrt of all suspects
FullPrimSuspects=horzcat(Subprimes,PrimeSuspects)%adds subprimes to suspects
while loop==1
    elementCheck=elementCheck+1
    LocateCell=(elementCheck;1)
    FullUpTo=PrimeSuspects<LocateCell


loop=0
end
