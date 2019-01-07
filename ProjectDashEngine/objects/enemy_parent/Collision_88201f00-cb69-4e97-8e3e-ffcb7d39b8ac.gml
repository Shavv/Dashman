/// @description dmg
if hit=false
{
 if other.charge=10
 {
  hp-=5
  hit=true
  alarm[11]=20
 }
  else
 {
  hp-=1
  with (other)
  {
   instance_destroy()
  }
 }
 
}

