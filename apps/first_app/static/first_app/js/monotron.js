var audioContext = new webkitAudioContext();
var monotron = new monotron(audioContext);
monotron.connect(audioContext.destination);
