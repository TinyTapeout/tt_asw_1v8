v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 570 -380 1370 20 {flags=graph
y1=0
y2=1.8
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=8.7392494e-07
x2=1.1316225e-06
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0


dataset=-1
unitx=1
logx=0
logy=0
color="6 4"
node="bus_out
ctrl"}
B 2 560 110 1360 510 {flags=graph
y1=0
y2=1.8
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=8.7392494e-07
x2=1.1316225e-06
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="ctrl
bus_out_parax"
color="4 6"
dataset=-1
unitx=1
logx=0
logy=0
}
B 2 560 580 1360 980 {flags=graph,unlocked
y1=35
y2=84
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=1.8
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0



unitx=1
logx=0
logy=0
rawfile=$netlist_dir/testbench_dc.raw

dataset=-1
sim_type=dc
color=4
node="\\"resistance;mod_r bus - 100u /\\""}
B 2 560 1040 1360 1440 {flags=graph,unlocked
y1=-0.0097
y2=-4.2e-10
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=6.3655518
x2=8.541617
divx=5
subdivx=8
xlabmag=1.0
ylabmag=1.0



unitx=1
logx=1
logy=0



dataset=-1
rawfile=$netlist_dir/testbench_ac.raw

sim_type=ac
color=4
node="\\"out_ac db20()\\""}
N 290 -270 310 -270 {
lab=bus_out}
N 310 -270 330 -270 {
lab=bus_out}
N 160 -270 230 -270 {
lab=#net1}
N 0 -560 0 -550 {
lab=vss}
N 110 -560 110 -550 {
lab=vdd}
N 0 -490 0 -480 {
lab=GND}
N 110 -490 110 -480 {
lab=GND}
N 310 -210 310 -200 {
lab=vss}
N 160 -310 170 -310 {
lab=vdd}
N 160 -250 170 -250 {
lab=vss}
N 280 120 280 140 {
lab=GND}
N 250 40 280 40 {
lab=mod}
N 280 40 280 60 {
lab=mod}
N 70 120 70 140 {
lab=GND}
N 40 40 70 40 {
lab=ctrl}
N 70 40 70 60 {
lab=ctrl}
N 160 -290 170 -290 {
lab=mod}
N -150 -310 -140 -310 {
lab=ctrl}
N 290 -100 310 -100 {
lab=bus_out_parax}
N 310 -100 330 -100 {
lab=bus_out_parax}
N 160 -100 230 -100 {
lab=#net2}
N 310 -40 310 -30 {
lab=vss}
N 160 -140 170 -140 {
lab=vdd}
N 160 -80 170 -80 {
lab=vss}
N 160 -120 170 -120 {
lab=mod}
N -150 -140 -140 -140 {
lab=ctrl}
N 150 750 220 750 {
lab=bus}
N 150 710 160 710 {
lab=vdd}
N 150 770 160 770 {
lab=GND}
N 350 880 350 900 {
lab=GND}
N 150 730 160 730 {
lab=mod_r}
N -160 710 -150 710 {
lab=vdd}
N 170 770 170 790 {
lab=GND}
N 160 770 170 770 {
lab=GND}
N 350 790 350 820 {
lab=mod_r}
N 350 670 350 730 {
lab=mod_r}
N 350 670 390 670 {
lab=mod_r}
N 270 810 270 830 {
lab=GND}
N 220 750 270 750 {
lab=bus}
N 350 730 350 790 {
lab=mod_r}
N 260 1310 330 1310 {
lab=out_ac}
N 260 1270 270 1270 {
lab=vdd}
N 260 1330 270 1330 {
lab=vss}
N 260 1290 270 1290 {
lab=mod_ac}
N -50 1270 -40 1270 {
lab=vdd}
N 370 1220 370 1240 {
lab=GND}
N 340 1140 370 1140 {
lab=mod_ac}
N 370 1140 370 1160 {
lab=mod_ac}
C {tt_asw_1v8.sym} 10 -280 0 0 {name=x1}
C {devices/code.sym} 350 -560 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
.include $::SKYWATER_STDCELLS/sky130_fd_sc_hd.spice


"
spice_ignore=false}
C {devices/code.sym} 200 -560 0 0 {name=SIMULATION
only_toplevel=false 
value="
.param mc_mm_switch=0
.control
save all
tran 500p 2u uic
write testbench.raw
reset
save all 
dc Vcm 0 1.8 0.01
remzerovec
write testbench_dc.raw

ac dec 10 1 200e6
remzerovec
write testbench_ac.raw

*quit 0
.endc
.end
"}
C {devices/vsource.sym} 110 -520 0 0 {name=V1 value=1.8 savecurrent=false}
C {devices/launcher.sym} 620 -460 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/testbench.raw tran"
}
C {devices/lab_pin.sym} 330 -270 0 1 {name=p2 sig_type=std_logic lab=bus_out
}
C {devices/res.sym} 260 -270 1 0 {name=R3
value=500
footprint=1206
device=resistor
m=1
lab=bus_out}
C {devices/capa.sym} 310 -240 0 0 {name=C3
m=1
value=10p
footprint=1206
device="ceramic capacitor"
lab=bus_out}
C {devices/gnd.sym} 110 -480 0 0 {name=l2 lab=GND}
C {devices/lab_pin.sym} 110 -560 2 1 {name=p5 sig_type=std_logic lab=vdd
}
C {devices/lab_pin.sym} 170 -310 2 0 {name=p6 sig_type=std_logic lab=vdd
}
C {devices/vsource.sym} 0 -520 0 0 {name=V2 value=0 savecurrent=false}
C {devices/gnd.sym} 0 -480 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 0 -560 2 1 {name=p7 sig_type=std_logic lab=vss
}
C {devices/lab_pin.sym} 170 -250 0 1 {name=p8 sig_type=std_logic lab=vss
}
C {devices/vsource.sym} 280 90 0 0 {name=V7 value="pulse(0 1.8 0 0 0 50n 100n)" savecurrent=false}
C {devices/gnd.sym} 280 140 0 0 {name=l10 lab=GND}
C {devices/lab_pin.sym} 250 40 0 0 {name=p16 sig_type=std_logic lab=mod}
C {devices/vsource.sym} 70 90 0 0 {name=V8 value="pulse(0 1.8 0 0 0 1u 2u)" savecurrent=false}
C {devices/gnd.sym} 70 140 0 0 {name=l11 lab=GND}
C {devices/lab_pin.sym} 40 40 0 0 {name=p17 sig_type=std_logic lab=ctrl

}
C {devices/lab_pin.sym} 170 -290 2 0 {name=p1 sig_type=std_logic lab=mod
}
C {devices/lab_pin.sym} -150 -310 0 0 {name=p3 sig_type=std_logic lab=ctrl

}
C {devices/lab_pin.sym} 310 -200 0 1 {name=p4 sig_type=std_logic lab=vss
}
C {tt_asw_1v8.sym} 10 -110 0 0 {name=x2
schematic=tt_asw_1v8_parax.sim
spice_sym_def="tcleval(.include [file normalize ../mag/tt_asw_1v8.sim.spice])"
tclcommand="textwindow [file normalize ../mag/tt_asw_1v8.sim.spice]"}
C {devices/lab_pin.sym} 330 -100 0 1 {name=p9 sig_type=std_logic lab=bus_out_parax
}
C {devices/res.sym} 260 -100 1 0 {name=R1
value=500
footprint=1206
device=resistor
m=1
lab=bus_out}
C {devices/capa.sym} 310 -70 0 0 {name=C1
m=1
value=10p
footprint=1206
device="ceramic capacitor"
lab=bus_out}
C {devices/lab_pin.sym} 170 -140 2 0 {name=p10 sig_type=std_logic lab=vdd
}
C {devices/lab_pin.sym} 170 -80 0 1 {name=p11 sig_type=std_logic lab=vss
}
C {devices/lab_pin.sym} 170 -120 2 0 {name=p12 sig_type=std_logic lab=mod
}
C {devices/lab_pin.sym} -150 -140 0 0 {name=p13 sig_type=std_logic lab=ctrl

}
C {devices/lab_pin.sym} 310 -30 0 1 {name=p14 sig_type=std_logic lab=vss
}
C {tt_asw_1v8.sym} 0 740 0 0 {name=x3}
C {devices/lab_pin.sym} 160 710 2 0 {name=p15 sig_type=std_logic lab=vdd
}
C {devices/gnd.sym} 170 790 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} 350 850 0 0 {name=Vcm value="1V" savecurrent=false}
C {devices/gnd.sym} 350 900 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} 390 670 0 1 {name=p18 sig_type=std_logic lab=mod_r}
C {devices/lab_pin.sym} 160 730 2 0 {name=p19 sig_type=std_logic lab=mod_r
}
C {devices/isource.sym} 270 780 0 0 {name=I0 value=100u savecurrent=true}
C {devices/gnd.sym} 270 830 0 0 {name=l5 lab=GND}
C {devices/lab_pin.sym} -160 710 2 1 {name=p20 sig_type=std_logic lab=vdd
}
C {devices/lab_wire.sym} 230 750 0 0 {name=p21 sig_type=std_logic lab=bus}
C {devices/lab_pin.sym} 270 1270 2 0 {name=p23 sig_type=std_logic lab=vdd
}
C {devices/lab_pin.sym} 270 1330 0 1 {name=p24 sig_type=std_logic lab=vss
}
C {devices/lab_pin.sym} 270 1290 2 0 {name=p25 sig_type=std_logic lab=mod_ac
}
C {devices/vsource.sym} 370 1190 0 0 {name=V3 value="ac 1 0" savecurrent=false}
C {devices/gnd.sym} 370 1240 0 0 {name=l6 lab=GND}
C {devices/lab_pin.sym} 340 1140 0 0 {name=p27 sig_type=std_logic lab=mod_ac}
C {devices/lab_pin.sym} -50 1270 0 0 {name=p26 sig_type=std_logic lab=vdd
}
C {tt_asw_1v8.sym} 110 1300 0 0 {name=x4}
C {devices/iopin.sym} 330 1310 0 0 {name=p28 lab=out_ac}
