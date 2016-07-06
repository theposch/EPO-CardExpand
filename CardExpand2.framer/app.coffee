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




# BOOKMARK ICON

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



bookmark_default.states.add
		show: {opacity: 1}
		hide: {opacity:0, x: 700}
		
bookmark_default.states.animationOptions =
		curve: 'spring(1200, 00, 0)'


bookmark_active.states.add
		show: {opacity: 1}
		hide: {opacity:0, x: 700}
		
bookmark_active.states.animationOptions =
		curve: 'spring(1400, 0, 0)'
		
		
bookmark_default.states.switchInstant 'hide'
bookmark_active.states.switchInstant 'hide'



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


# EXPAND CARD ANIMATIONS
expandCard = ->
	# Move Card out of Scroll container
	closeArea.bringToFront()
	# Move Card to top of screen
	Card.animate
		properties: (y:40)
		curve:  "spring-rk4(1000,60,0)"

	# Change Image Height
	CardImage.constraints.height = 400
	Card.constraints.height = Screen.height
	
	# Reset the constraints relative to the new Image Height
	m.layout.animate
		curve: "spring-rk4(1000,60,0)"
	Card.superLayer = container	
# Move all other cards out of screen
	avatar.states.switch 'hide'
	Close.states.switch 'show'
	bookmark_default.states.switch 'show'




goBack = ->
	# Move Card back into Scroll container
	Card.superLayer = scroll.content
	closeArea.sendToBack()
	# Reset the Card Constraints
	Card.constraints.height = 298
	CardImage.constraints.height = 150
	m.layout.animate
		curve: "bezier-curve(0.5,0.2,.12,1)"
		time: 0.3

		
	# Bring Card back to it's original position
	Card.animate
		properties: (y:432)
		curve: "bezier-curve(0.5,0.2,.12,1)"
		time: 0.3
		
	# Bring all other cards back to original position
	bookmark_active.states.switch 'hide'
	bookmark_default.states.switch 'hide'
	Utils.delay 0.65, ->
	
		avatar.states.switch 'show'
		Close.states.switch 'hide'
		

	
saveBookmark = ->
	bookmark_active.states.switch 'show'
	





Card.on Events.Click,->
	expandCard()


closeArea.on Events.Click, ->
	goBack()

bookmark_default.on Events.Click, ->
	saveBookmark()