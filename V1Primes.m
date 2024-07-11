
clc, clearvars;
NumOfFailedPrimes=0
elementCheck = 1;
loop = 1;
Subprimes = [2, 3];
BigestPosPrime=1000000000
tic
TestMe = sqrt((((1:BigestPosPrime) .* 24) + 1)); %basic 
PrimeSuspects = TestMe(floor(TestMe) == TestMe); %remove all non-integers

FullPrimSuspects=horzcat(Subprimes,PrimeSuspects);%adds subprimes to suspects
while elementCheck <= numel( PrimeSuspects )%when to stop, def change this but functional
    LocateCell=PrimeSuspects(1,elementCheck);%grab the first/next cell
    FullUpTo=PrimeSuspects<=sqrt(LocateCell);%logical Indexing for less than
    filtered_elements=PrimeSuspects(FullUpTo);
    RemainderCheck=rem(LocateCell,filtered_elements);
    ZeroCheck=any(RemainderCheck==0);
    if ZeroCheck==1
        PrimeSuspects(PrimeSuspects == LocateCell) = [];

    else
        elementCheck=elementCheck+1;
        NumOfFailedPrimes=NumOfFailedPrimes+1
    end
loop=0;
FullPrimSuspects=horzcat(Subprimes,PrimeSuspects);
end
toc