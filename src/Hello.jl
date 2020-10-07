using ThinkJulia
using Luxor
using Colors

function drawHangmanLevel(level) 
Drawing(1000, 1000, "$level.svg")
origin()

lineWidth = 40
halfWidth = lineWidth / 2
setline(lineWidth)
sethue(RGBA(0, 0, 0, 1))

boundingBox = BoundingBox()
# println(boundingBox)
scale(1, -1)

tl = Point(boundingBox.corner1.x, boundingBox.corner2.y)
tr = Point(boundingBox.corner2.x, boundingBox.corner2.y)
bl = Point(boundingBox.corner1.x, boundingBox.corner1.y)
br = Point(boundingBox.corner2.x, boundingBox.corner1.y)

pt0 = bl + (0, lineWidth / 2)
pt1 = br + (0, lineWidth / 2)

pt2 = between(bl, br, 0.3)
pt3 = between(tl, tr, 0.3)

pt4 = between(tl, tr, 0.65)

pt5 = between(bl, br, 0.65)
pt6 = between(pt4, pt5, 0.15)

if level >= 0 
line(pt0, pt1, :stroke)
line(pt2, pt3, :stroke)
line(pt3 - (0, lineWidth / 2), pt4 - (0, lineWidth / 2), :stroke)
line(pt4, pt6, :stroke)
end

setlinecap("round")

# head
radius = distance(pt4, pt6) / 2
pt7 = pt6 - (0, radius)
if level >= 1 
circle(pt7, radius, :stroke)
end

# body
pt8 = pt7 - (0, radius)
pt9 = pt8 - (0, 4radius)
if level >= 2 
line(pt8, pt9, :stroke)
end

# arms
pt10 = pt8 - (0, radius * 0.75)
pt11 = pt10 - (1.75radius, 1.75radius)
if level >= 3 
line(pt10, pt11, :stroke)
end

pt12 = pt10 + (1.75radius, -1.75radius)
if level >= 4 
line(pt10, pt12, :stroke)
end

# legs
pt13 = pt9 - (1.75radius, 1.75radius)
if level >= 5 
line(pt9, pt13, :stroke)
end

pt14 = pt9 + (1.75radius, -1.75radius)
if level >= 6 
line(pt9, pt14, :stroke)
end

finish()
end
# preview()
drawHangmanLevel(0)
drawHangmanLevel(1)
drawHangmanLevel(2)
drawHangmanLevel(3)
drawHangmanLevel(4)
drawHangmanLevel(5)
drawHangmanLevel(6)
