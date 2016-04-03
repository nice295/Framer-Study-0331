(function() {
  var PSD, device, scroll;

  device = new Framer.DeviceView();

  device.setupContext();

  device.deviceType = "samsung-galaxy-note-5-gold";

  device.contentScale = 1;

  PSD = Framer.Importer.load("imported/Scroll");

  scroll = ScrollComponent.wrap(PSD.List);

  scroll.scrollHorizontal = false;

  scroll.parent = PSD.Screen;

  PSD.BottomBar.bringToFront();

}).call(this);
