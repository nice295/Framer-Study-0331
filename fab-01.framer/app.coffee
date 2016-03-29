# Import file "fab-01"
psd = Framer.Importer.load("imported/fab-01@1x")
Utils.globalLayers(psd)

# Setup
Framer.Defaults.Animation = 
	curve: "spring(300,30,0)"
	time: 0.4

isHome = true

# Overlay
shadebg = new Layer
	width: Screen.width
	height: Screen.height
	backgroundColor: "black"
	opacity: 0.9

shadebg.placeBefore(bg)

# States
tweet.states.add
	Home: opacity: 1
	Onboard: opacity: 0

BirdX.states.add
	Home: opacity: 0
	Onboard: opacity: 1

shadebg.states.add
	Home: opacity: 0
	Onboard: opacity: 0.8	

tweet.states.switchInstant "Home"
BirdX.states.switchInstant "Home"
shadebg.states.switchInstant "Home"

# Add States
Circle2.states.add
	Home:
		opacity: 1
		x: tweet.x
		y: tweet.y
		rotationZ: Circle2.rotationZ

	Onboard:
		opacity: 1
		x: Circle2.x
		y: Circle2.y
		rotationZ: Circle2.rotationZ + 360

# Switch instant
Circle2.states.switchInstant "Home"

# Interaction
bgButton.on Events.Click, ->
	# Switch to onboard
	if isHome
		tweet.states.switch "Onboard"
		BirdX.states.switch "Onboard"
		shadebg.states.switch "Onboard"

		Circle2.states.switch "Onboard", delay: 0.06 * 0
	
		isHome = false

	# Switch back to home
	else
		tweet.states.switch "Home"
		BirdX.states.switch "Home"
		shadebg.states.switch "Home", delay: 0.3

		Circle2.states.switch "Home", delay: 0.06 * 0

		isHome = true
