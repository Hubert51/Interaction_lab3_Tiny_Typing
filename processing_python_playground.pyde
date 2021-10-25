# def setup():
#     size(480, 120)

# def draw():
#     if  mousePressed:
#         fill(0)
#     else:
#         fill(255)
#     ellipse(mouseX, mouseY, 80, 80)


'''
SCROLL INPUT EXAMPLE

background_color = 127
def setup(): 
    size(100, 100)

def draw(): 
    global background_color
    background(background_color)

def mouseWheel(event): 
    global background_color

    e = event.getCount()
    background_color += event.getCount()
    # keep value in range
    background_color = background_color % 255
'''

# def setup():
#     global f
#     size(200,200)
#     f = createFont("Arial",16)

# def draw():
#     global f
#     background(255)
#     textFont(f,16)            
#     fill(0)                       
#     text("Hello Strings!",10,100)


  
# Drag (click and hold) your mouse across the 
# image to change the value of the rectangle

# value = 0

# def draw(): 
#     fill(value)
#     rect(25, 25, 50, 50)

# def mouseDragged(): 
#     global value
#     value = value + 5
#     if value > 255:
#         value = 0


# value = 0

# def draw(): 
#     fill(value)
#     rect(25, 25, 50, 50)

# def mouseClicked(): 
#     global value
#     string = "Hello Strings!"
#     if value == 0:
#         value = 255
#     else:
#         value = 0
        


# def setup():
#     size(100, 100)
#     textSize(60)

# def draw():
#     background(0)
#     text(key, 20, 75)   # Draw at coordinate (20,75)

# Even though there are multiple objects, we still only need one class. 
# No matter how many cookies we make, only one cookie cutter is needed.
class Car(object):
    # The Constructor is defined with arguments.
    def __init__(self, c, xpos, ypos, xspeed):
        self.c = c
        self.xpos = xpos
        self.ypos = ypos
        self.xspeed = xspeed
        
    def display(self):
        stroke(0)
        fill(self.c)
        rectMode(CENTER)
        rect(self.xpos, self.ypos, 20, 10);
    
    def drive(self):
        self.xpos = self.xpos + self.xspeed;
        if self.xpos > width:
            self.xpos = 0

myCar1 = Car(color(255, 0, 0), 0, 100, 2)
myCar2 = Car(color(0, 255, 255), 0, 10, 1)

def setup():
    size(200,200)

def draw(): 
    background(255)
    myCar1.drive()
    myCar1.display()
    myCar2.drive()
    myCar2.display()
