function [Req_Parallel, Req_Series] = resistor_calc(Rs)
Req_Parallel = 1/((1/(Rs(1))) + (1/(Rs(2))));
Req_Series = Rs(1) + Rs(2);
%fprintf('Parallel Equivalence: %.2f\nSeries Equivalence: %.2f\n', Req_Parallel, Req_Series);
end
