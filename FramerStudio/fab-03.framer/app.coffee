# Import file "fab-03"
psd = Framer.Importer.load("imported/fab-03@1x")

# Import file "Nexus 5 Template"
Utils.globalLayers(psd)

# Setup
Framer.Defaults.Animation = 
	curve: "spring(300,30,0)"
	time: 0.4

isHome = true
circles = [Circle0, Circle1, Circle2, Circle3, Circle4]

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
for circle, i in circles
	circle.states.add
		Home:
			opacity: 1
			x: tweet.x
			y: tweet.y
			rotationZ: circle.rotationZ
	
		Onboard:
			opacity: 1
			x: circle.x
			y: circle.y
			rotationZ: circle.rotationZ + 360

	# Switch instant
	circle.states.switchInstant "Home"

# Interaction
bgButton.on Events.Click, ->
	# Switch to onboard
	if isHome
		tweet.states.switch "Onboard"
		BirdX.states.switch "Onboard"
		shadebg.states.switch "Onboard"

		for circle, i in circles
			circle.states.switch "Onboard", delay: 0.06 * i
	
		isHome = false

	# Switch back to home
	else
		tweet.states.switch "Home"
		BirdX.states.switch "Home"
		shadebg.states.switch "Home", delay: 0.3

		for circle, i in circles
			circle.states.switch "Home", delay: 0.06 * i

		isHome = true
