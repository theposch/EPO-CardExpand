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


# Card -----------------------------------------------------------------------
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
		
		
m.layout.set()





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
	
m.layout.set()
	


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
m.layout.set()

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
m.layout.set()

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
m.layout.set()

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
m.layout.set()

# Article Text -----------------------------------------------------------------------


text1 = new Layer
	name: "Article Text"
	superLayer: Card
	width: 750
	height: 1836
	image: "images/text1.png"
text1.constraints =
	top: [cardTimestamp,16]

m.layout.set()


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
m.layout.set()

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
m.layout.set()





bookmark_active = new Layer
	superLayer: cardHeader
	width: 36
	height: 48
	image: "images/bookmark_active.png"

bookmark_active.constraints =
	trailing: [Actions,24]
	top: 16
m.layout.set()



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
audio = new Audio('images/Swipe1.wav');
audio2 = new Audio('images/Swipe1.wav');


layerA = new Layer
	width: 750
	backgroundColor: "#51497A"
	superLayer: container



releaseText = new m.Text	
	text: "Pull to close"
	textAlign: 'center'
	superLayer: layerA
	color: '#9585DD'
	fontSize: '12px'
	opacity: 0.4
	fontWeight: 'bold'
releaseText.constraints =
	leading: 0
	trailing: 0
	top: 20
m.layout.set()

constraints = new Layer
	width: 750
	height: 1274
	backgroundColor: "transparent"
	y: 60
	
###

# Card2 -----------------------------------------------------------------------
Card2 = new Layer
	name: "Card 2"
	y: 432
	backgroundColor: "rgba(255,255,255,1)"
	shadowSpread: 0
	shadowColor: "rgba(0,0,0,0.10)"
	shadowY: -0.5
	shadowBlur: 14
	height: 598
	borderRadius: 16
	clip: true

	
Card2.constraints =
		leading:0
		trailing: 0
		top: [Card, 16]
		
		
m.layout.set()



cardHeader2 = new Layer
	superLayer: Card2
	backgroundColor: "transparent"

cardHeader2.constraints =
	top: 0
	leading: 0
	trailing:0
	height: 56

m.layout.set(cardHeader2)

# Card Image  -----------------------------------------------------------------------	
CardImage2 = new Layer
	name: "Card Image 2"
	superLayer: Card2
	image: "images/127129.jpg"
	
CardImage2.constraints = 
	top: [cardHeader2,0]
	leading: 0
	width: 125
	height: 150

m.layout.set(CardImage2)
# Card Text -----------------------------------------------------------------------


cardHeadline2 = new m.Text
	name: "Headline"
	superLayer: Card2
	text: "Bone marrow braces caries chronic external otitis"
	fontFamily: "SFUIDisplay-Light"
	fontSize: "21"
	color: "#5A6377"
	
	
cardHeadline2.constraints =
	top: [cardHeader2, 16]
	leading: [CardImage2, 16]
	trailing: 16
	height: 40
	
m.layout.set(cardHeadline2)



cardTimestamp2 = new m.Text
	name: "Time Stamp"
	superLayer: Card2
	text: "5 min read"
	fontFamily: "SFUIDisplay-Regular"
	fontSize: "13"
	
	color: "#A6AEC0"
cardTimestamp2.constraints =
	top: [cardHeadline2, 32]
	leading: [CardImage2, 16]
	trailing: 16
	
m.layout.set(cardTimestamp2)
	





###


# Scroll Container
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





expandCard = ->
	layerA.animate
		properties: 
			opacity: 1
		curve: "ease-in"
			
	Navigation_Bar.animate
		properties: {blur: 62}
	
			
	Card.superLayer = container
	Navigation_Bar.sendToBack()
	Card.draggable.enabled = true
	Card.draggable.horizontal = false
	Card.draggable.constraints = constraints.frame 
	closeArea.bringToFront()
	releaseText.opacity = 0
			
		
	Card.animate
		properties:
			y:40
		curve: "spring-rk4(1500,120,2)"
	
	
	CardImage.constraints.height = 400
	Card.constraints.height = Screen.height
			
	m.layout.animate
		curve: "spring-rk4(3000,140,2)"
			
	avatar.states.switch 'hide'
	Close.states.switch 'show'
	bookmark_default.states.switch 'show'
	
	

goBack = ->

	layerA.animate
		properties: 
			opacity: 0
		curve: "ease-out"
		time: 1
		# Move Card back into Scroll container
	Card.draggable.enabled = false
	Card.superLayer = scroll.content
	closeArea.sendToBack()
		
	Card.animate
		properties: (y:260)
		curve: "ease-in"
		time:0.001
	
		
	Utils.delay 0.006, ->
			
		Card.animate
			properties: (y:432)
			curve: "ease-in"
			time:0.00000000001
					# Reset the Card Constraints
		Card.constraints.height = 298
		CardImage.constraints.height = 150
		m.layout.animate
			curve: "ease-in"
			time: 0.3
		bookmark_default.states.switch 'hide'
		Navigation_Bar.bringToFront()
		avatar.states.switch 'show'
		Close.states.switch 'hide'
		Card.animate	
			properties: 
				shadowSpread: 0
				shadowColor: "rgba(0,0,0,0.10)"
				shadowY: -0.5
				shadowBlur: 14
			curve: "ease-in"
			time: 0.3
				
	
	
Card.on Events.Drag, ->
	scale = Utils.modulate(Card.y, [0,100], [0.9,1], true)
	releaseText.scale = scale
	
	opacity = Utils.modulate(Card.y, [0,200], [0.6,1], true)
	releaseText.opacity = opacity
	
	y = Utils.modulate(Card.y, [0,190], [-103,96], true)
	releaseText.y = y
	
	height = Utils.modulate(Card.y, [0,200], [0,1100], true)
	layerA.height = height
	


	
Card.on Events.DragEnd, ->
	layerA.height = 100
	if Card.y > 160
		goBack()
		layerA.height = 0
	
		








Card.on Events.Click,->
	expandCard()


closeArea.on Events.Click, ->
	goBack()






