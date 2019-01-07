/// @description init

//stats
hp=5

range=32
angle=0
rotate=1
spd=0.03
//create drones
i=instance_create(x,y,enemy_eye_drone)
j=instance_create(x,y,enemy_eye_drone)
h=instance_create(x,y,enemy_eye_drone)
c=instance_create(x,y,enemy_eye_drone)
v=instance_create(x,y,enemy_eye_drone)
b=instance_create(x,y,enemy_eye_drone)
k=instance_create(x,y,enemy_eye_drone)
l=instance_create(x,y,enemy_eye_drone)

h.angle=0.8
j.angle=1.6
i.angle=2.4
c.angle=3.2
v.angle=4
b.angle=4.8
k.angle=5.6
l.angle=6.4

h.lenght=range
i.lenght=range
j.lenght=range
c.lenght=range
v.lenght=range
b.lenght=range
k.lenght=range
l.lenght=range

h.mdelay=10//50
j.mdelay=10//100
i.mdelay=10//150
c.mdelay=10//200   
v.mdelay=10//250
b.mdelay=10//300
k.mdelay=10//350
l.mdelay=10//400

h.master=id
i.master=id
j.master=id
c.master=id
v.master=id
b.master=id
k.master=id
l.master=id


with (h) {event_perform(ev_create,0) delay=mdelay}
with (j) {event_perform(ev_create,0) delay=mdelay}
with (i) {event_perform(ev_create,0) delay=mdelay}
with (c) {event_perform(ev_create,0) delay=mdelay}
with (v) {event_perform(ev_create,0) delay=mdelay}
with (b) {event_perform(ev_create,0) delay=mdelay}
with (k) {event_perform(ev_create,0) delay=mdelay}
with (l) {event_perform(ev_create,0) delay=mdelay}

