clc;
clear all;

rint = 30;
rmem = 10;
rext = 50;

Vap = .150; %volts

stages = 200;

data = [];

Iin = [];
Vrmem = [];

req = rint + rmem + rext; %initialize req for 1 stage

for i = 1 : (stages - 1)
    req_prev = req*(rmem)/(rmem + req);
    req = req_prev + rint + rext;
    Iin(i) = Vap / req;
    Imem(i) = Iin(i) * (req)/(rmem + req);
    Iout(i) = Iin(i) * (rmem)/(rmem + req);
    Vmem(i) = Imem(i) * rmem;
    data(i) = req;
end

x = [1:length(data)];
plot(x,data);

disp(req);
disp(Vmem);