
function plotPrimeCompositeDensity (MultiUseVal, BigestPosPrime)
NumOfFailedPrimes=0;
NumOfSuccessPrimes=0;
elementCheck = 1;
Subprimes = [2, 3];
DensityUp=1;
tic
TestMe = sqrt(((0:24:(BigestPosPrime)) +1)); %basic 

PrimeSuspects = TestMe(floor(TestMe) == TestMe); %remove all non-integers
CheckThatThing=PrimeSuspects;
FullPrimSuspects=horzcat(Subprimes,PrimeSuspects);%adds subprimes to suspects
while elementCheck <= numel( PrimeSuspects )%when to stop, def change this but functional
    LocateCell=PrimeSuspects(1,elementCheck);%grab the first/next cell
    FullUpTo=PrimeSuspects<=sqrt(LocateCell);%logical Indexing for less than
    filtered_elements=PrimeSuspects(FullUpTo);
    RemainderCheck=rem(LocateCell,filtered_elements);
    ZeroCheck=any((rem(LocateCell,filtered_elements))==0);
    if ZeroCheck==1
        PrimeSuspects(PrimeSuspects == LocateCell) = [];
        NumOfFailedPrimes=NumOfFailedPrimes+1;
    else 
        elementCheck=elementCheck+1;
       NumOfSuccessPrimes=NumOfSuccessPrimes+1;
    end
end


endloop=0;
FullPrimSuspects=horzcat(Subprimes,PrimeSuspects);
Ratio=vertcat(NumOfSuccessPrimes,NumOfFailedPrimes);
toc
ListOComposites=1:MultiUseVal;
ListOComposites=setdiff(ListOComposites,FullPrimSuspects);
basicAFXvals = 1:MultiUseVal;
DensityUp = 1;


while DensityUp <= MultiUseVal
    LogicLessThan = FullPrimSuspects <= DensityUp; % Logical indexing for primes
    QP = numel(FullPrimSuspects(LogicLessThan)); % The number of Primes that are less than DensityUp
    DensityPrimList(1, DensityUp) = QP/ DensityUp; % Creating and adding densities
    DensityUp = DensityUp + 1;
end

DensityUp = 1;


while DensityUp <= MultiUseVal
    LogicLessThan = ListOComposites <= DensityUp; % Logical indexing for composites
    QP = numel(ListOComposites(LogicLessThan)); % The number of Composites that are less than DensityUp
    DensityCompList(1, DensityUp) = QP/DensityUp; % Creating and adding densities
    DensityUp = DensityUp + 1;
end

% end
plot(basicAFXvals,DensityPrimList,'b-','Linewidth',2)
hold on;
plot(basicAFXvals,DensityCompList,'r-','LineWidth',2)
xlabel('Number Range')
ylabel('Density Below (x)')
legend('Prime Density','Composit Density')
title('Density of Primes vs. Composits')



end