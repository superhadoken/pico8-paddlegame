pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
-- paddle
padx = 52
pady = 122
padw = 24
padh = 4

-- ball
ballx = 64
bally = 64
ballsize = 3
ballxdir = 5
ballydir = -3

--bounce the ball off the paddle
function bouncepaddle()
 if ballx>=padx and
  ballx<=padx+padw and
  bally>pady then
  sfx(1)
  ballydir=-ballydir
 end
end

function moveball()
 ballx+=ballxdir
 bally+=ballydir
end

function losedeadball()
 if bally>128 then
  sfx(2)
  bally=24
 end
end

function movepaddle()
 if btn (0) then
 	padx-=3
 elseif btn(1) then
  padx+=3
 end
end

function bounceball()
 --left
 if ballx<ballsize then
  ballxdir=-ballxdir
  sfx(0)
 end
 
 --right
 if ballx>128-ballsize then
  ballxdir=-ballxdir
  sfx(0)
 end
 
 --top
 if bally<ballsize then
  ballydir=-ballydir
  sfx(0)
 end
end

--
-- the update ♥
--
function _update()
 movepaddle()
 bounceball()
 bouncepaddle()
 moveball()
 losedeadball()
end

--
-- the draw 
--
function _draw()
 --clrea the screen
 rectfill(0,0,128,128,3)
 
 --draw the paddle
 rectfill(padx,pady,padx+padw,pady+padh,15)
 
 --draw the ball
 circfill(ballx, bally, ballsize, 15)
end
__sfx__
00040000370303f0702c04026000220001c0001900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000600002b05034070370400a000020002f00025000200001d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000800003e050340502105019050100500e0500b00009000070000600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
