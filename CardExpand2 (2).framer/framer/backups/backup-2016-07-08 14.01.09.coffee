# Import file "EPO-cardExpand_proto" (sizes and positions are scaled 1:2)
sketch = Framer.Importer.load("imported/EPO-cardExpand_proto@2x")
m = require "material-kit"

for layerGroupName of sketch
  window[layerGroupName] = sketch[layerGroupName]
  
  # Store original position of all elements from Sketch file
  sketch[layerGroupName].originalFrame = window[layerGroupName].frame


# Remove White Sketch Artboard Background
for name, layer of sketch when layer._info.kind is
	"artboard"
		layer.backgroundColor = null
		
background = new BackgroundLayer
	backgroundColor: "#F6f6f6"	
Card1.visible = false


container = new Layer
	width: Screen.width
	height:  Screen.height
	backgroundColor: "transparent"


# Card Setup -----------------------------------------------------------------------


# Create the Card Background layer
Card = new Layer
	name: "Card 1"
	y: 432
	backgroundColor: "rgba(255,255,255,1)"
	shadowSpread: 0
	shadowColor: "rgba(0,0,0,0.10)"
	shadowY: -0.5
	shadowBlur: 14
	height: 598
	borderRadius: 16
	clip: true
	
Card.constraints =
		leading:0
		trailing: 0
		
		
m.layout.set(Card)




# Card Header -------------

# Create the Card Header Background
cardHeader = new Layer
	superLayer: Card
	backgroundColor: "transparent"

cardHeader.constraints =
	top: 0
	leading: 0
	trailing:0
	height: 56

m.layout.set(cardHeader)

# Card Image  -----------------------------------------------------------------------

# Set the Card Image

CardImage = new Layer
	name: "Card Image"
	superLayer: Card
	image: "images/127129.jpg"
	
CardImage.constraints = 
	top: [cardHeader,0]
	leading: 0
	trailing: 0
	height: 150

m.layout.set(CardImage)


# Card Text -----------------------------------------------------------------------


cardHeadline = new m.Text
	name: "Headline"
	superLayer: Card
	text: "Bone marrow braces caries chronic external otitis"
	fontFamily: "SFUIDisplay-Light"
	fontSize: "21"
	color: "#5A6377"
	
cardHeadline.constraints =
	top: [CardImage, 16]
	leading: 16
	trailing: 16

	
m.layout.set(cardHeadline)



cardTimestamp = new m.Text
	name: "Time Stamp"
	superLayer: Card
	text: "5 min read"
	fontFamily: "SFUIDisplay-Regular"
	fontSize: "13"
	color: "#A6AEC0"
cardTimestamp.constraints =
	top: [cardHeadline, 32]
	leading: 16
	trailing: 16
	
m.layout.set(cardTimestamp)
	


# Avatar -----------------------------------------------------------------------

avatar = new Layer
	superLayer: cardHeader
	name: "Avatar"
	width: 64
	height: 64
	image: "images/avatar.png"
	
	
avatar.constraints =
	leading: 16
	top: 14
m.layout.set(avatar)

avatar.states.add
	show: {opacity:1, rotationY: 0}
	hide: {opacity:0, rotationY: 90}
avatar.states.switchInstant 'show'
avatar.states.animationOptions =
	curve: "bezier"
	time: 0.2
	
# Category Text -----------------------------------------------------------------------

category = new m.Text
	name: "Category"
	superLayer: cardHeader
	text: "Clinical Insights"
	fontFamily: "SFUIText-Semibold"
	fontSize: "14"
	color: "#5A6377"
	
category.constraints =
	leading: [avatar,16]
	top: 12
m.layout.set(category)

# Source Text -----------------------------------------------------------------------

source = new m.Text
	name: "Article Source"
	superLayer: cardHeader
	text: "athenaHealth"
	fontFamily: "SFUIText-Light"
	fontSize: "14"
	color: "#A6AEC0"
	
source.constraints =
	leading: [avatar,16]
	top: [category,4]
m.layout.set(source)

# Dot Icon  -----------------------------------------------------------------------
Actions = new Layer
	name: "Dot Action"
	superLayer: cardHeader
	width: 8
	height: 32
	image: "images/Actions.png"
Actions.constraints =
	trailing: 24
	top:20
m.layout.set(Actions)

# Article Text -----------------------------------------------------------------------


text1 = new Layer
	name: "Article Text"
	superLayer: Card
	width: 750
	height: 1836
	image: "images/text1.png"
text1.constraints =
	top: [cardTimestamp,16]

m.layout.set(text1)


# Close Icon -----------------------------------------------------------------------

Close = new Layer
	name: "Close Icon"
	superLayer: cardHeader
	width: 64
	height: 64
	image: "images/Close.png"

Close.constraints =
	leading: 16
	top: 14
m.layout.set(Close)

Close.states.add
	show: {opacity:1, rotationY: 0}
	hide: {opacity:0, rotationY: 90}
	
Close.states.switchInstant 'hide'

Close.states.animationOptions =
	curve: "bezier"
	time: 0.2
	
	
# Trigger area to close the card
closeArea = new Layer
	name: "Close Trigger Area"
	superLayer: container
	height: 112
	width: 128
	backgroundColor: "transparent"
	y: 60

# Book Mark Icon -----------------------------------------------------------------------

bookmark_default = new Layer
	superLayer: cardHeader
	width: 36
	height: 48
	image: "images/bookmark_default.png"

bookmark_default.constraints =
	trailing: [Actions,24]
	top: 16
m.layout.set(bookmark_default)



bookmark_active = new Layer
	superLayer: cardHeader
	width: 36
	height: 48
	image: "images/bookmark_active.png"

bookmark_active.constraints =
	trailing: [Actions,24]
	top: 16
m.layout.set(bookmark_active)



bookmark_active.states.add
	show: {opacity: 1}
	hide: {opacity: 0, x: 700}
	
bookmark_active.states.switchInstant 'hide'


bookmark_default.states.add
	show: {opacity: 1}
	hide: {opacity: 0, x: 700}
	
bookmark_default.states.switchInstant 'hide'

bookmark_active.states.animationOptions =
	curve: "spring-rk4(900,50,0)"
	
bookmark_default.states.animationOptions =
	curve: "spring-rk4(900,50,0)"

# Pull To Close Setup


pullToCloseBackground = new Layer
	width: 750
	backgroundColor: "#51497A"
	superLayer: container



releaseText = new m.Text	
	text: "Pull to close"
	textAlign: 'center'
	superLayer: pullToCloseBackground
	color: '#9585DD'
	fontSize: '12px'
	fontWeight: 'bold'
	
	
releaseText.constraints =
	leading: 0
	trailing: 0
	top: 20
m.layout.set(releaseText)

constraints = new Layer
	width: 750
	height: 1274
	backgroundColor: "transparent"
	y: 60
	
# Home Feed Scroll


scroll = new ScrollComponent
	width: Screen.width
	height: Screen.height
	scrollHorizontal: false
	superLayer: container

Card.superLayer = scroll.content
Card2.superLayer = scroll.content
Card3.superLayer = scroll.content


Navigation_Bar.superLayer = container
Navigation_Bar.bringToFront()


# when scrolling, move navbar 
scroll.on Events.Move, ->
	
    y = Utils.modulate(scroll.scrollY, [0,240], [0,-240], true)
    Navigation_Bar.y = y 


# Expand Animation ------------------------------



# Animate IN ----------------------------------------------------
expandCard = ->
	
	
	pullToCloseBackground.animate
		properties: 
			opacity: 0.6
		curve: "ease-in"
			
	# Move the Card out of the Scroll container by changing it's superLayer
	Card.superLayer = container
	# Send Navbar into background
	Navigation_Bar.sendToBack()
	# Make the Card draggable
	Card.draggable.enabled = true
	Card.draggable.horizontal = false
	Card.draggable.constraints = constraints.frame 
	# bring the Close Trigger Area to the front
	closeArea.bringToFront()
	releaseText.opacity = 0
	
	# Animate the Card position
	Card.animate
		properties:
			y:40
		curve: "cubic-bezier(0.2, 0.0, 0.2, 1)"
		time: 0.3	
		
	# Change the Image Height
	CardImage.constraints.height = 200
	# Animate the Card Background Height to take up the whole screen
	Card.constraints.height = Screen.height
	# Animate all elements realative to the new Image and Card constraints
	m.layout.animate
		curve: "cubic-bezier(0.2, 0.0, 0.2, 1)"
		time: 0.3	
		
	# Hide the Avatar and show the Close Icon
	avatar.states.switch 'hide'
	Close.states.switch 'show'
	# Show the Bookmark Icon
	bookmark_default.states.switch 'show'
	
	
	
	
	
# Animate OUT ----------------------------------------------------

goBack = ->

	pullToCloseBackground.animate
		properties: 
			opacity: 0
		curve: "cubic-bezier(0.2, 0.0, 0.2, 1)"
		time: 0.2
		
	# Remove the Drag Events on the Card
	Card.draggable.enabled = false
	
	# Move Card back into Scroll container
	Card.superLayer = scroll.content
	closeArea.sendToBack()

	# Animate the Cards position back into the Scroll Container
	Card.animate
		properties: (y:432)
		curve: "cubic-bezier(0.2, 0.0, 0.2, 1)"
		time:0.2
	
	# Reset the Card Constraints and Image height
	CardImage.constraints.height = 150
	Card.constraints.height = 298

	# Animate all constraints back to original values
	m.layout.animate
		curve: "cubic-bezier(0.2, 0.0, 0.2, 1)"
		time: 0.2
		
	# Hide Bookmark adn Close Icon, Show Avatar
	bookmark_default.states.switch 'hide'
	Close.states.switch 'hide'
	avatar.states.switch 'show'
			
	# Show Navigation_Bar
	Navigation_Bar.bringToFront()

	







# EVENTS ----------------------------

# When Clicking on the Card, Expand the Card
Card.on Events.Click,->
	expandCard()


# When Clicking the Close Icon, Close the Card
closeArea.on Events.Click, ->
	goBack()


# When Dragging the Card down, animate the "Pull to close" Text
Card.on Events.Drag, ->

	scale2 = Utils.modulate(Card.y, [0,400], [0.5,1.2], true)
	releaseText.scale = scale2
	
	opacity = Utils.modulate(Card.y, [0,240], [0,1], true)
	releaseText.opacity = opacity
	
	
	y = Utils.modulate(Card.y, [0,190], [-103,96], true)
	releaseText.y = y
	
	height = Utils.modulate(Card.y, [0,200], [0,1200], true)
	pullToCloseBackground.height = height
	


# When Dragging the Card Down, close the Card
Card.on Events.DragEnd, ->
	pullToCloseBackground.height = 100
	if Card.y > 160
		goBack()
		pullToCloseBackground.height = 0
	
		





