var irc = require('irc');

var bot = new irc.Client('apink.hanirc.org', 'makjoa_bot', {
    debug: true,
    channels: ['#okjsp'],
});


bot.addListener('error', function(message) {
    console.error('ERROR: %s: %s', message.command, message.args.join(' '));
});

bot.addListener('message#blah', function (from, message) {
    console.log('<%s> %s', from, message);
});

bot.addListener('message', function (from, to, message) {
    console.log('%s => %s: %s', from, to, message);

    if ( to.match(/^[#&]/) ) {
        // channel message
        if ( message.match(/hello/i) ) {
            bot.say(to, 'Hello there ' + from);
        }
        if ( message.match(/dance/) ) {
            setTimeout(function () { bot.say(to, "\u0001ACTION dances: :D\\-<\u0001") }, 1000);
            setTimeout(function () { bot.say(to, "\u0001ACTION dances: :D|-<\u0001")  }, 2000);
            setTimeout(function () { bot.say(to, "\u0001ACTION dances: :D/-<\u0001")  }, 3000);
            setTimeout(function () { bot.say(to, "\u0001ACTION dances: :D|-<\u0001")  }, 4000);
        }
    }
    else {
        // private message
    }
});
bot.addListener('join', function(channel, who) {
    console.log('%s has joined %s', nicklist, channel);			   
});			

bot.addListener('pm', function(nick, message) {
    console.log('Got private message from %s: %s', nick, message);
});

bot.addListener('part', function(channel, who, reason) {
    console.log('%s has left %s: %s', who, channel, reason);
});
bot.addListener('kick', function(channel, who, by, reason) {
    console.log('%s was kicked from %s by %s: %s', who, channel, by, reason);
});

var server = require('http').createServer(function(req,res){

//	fs.readFile('index.html',function(error,data){
//		res.writeHead(200,{'Content-Type':'text/html'});
//		res.end(data);
//	});

}).listen(8001,function(){

	console.log('Server Running Start');

});;

var io     = require('socket.io').listen(server);
var nicklist = {};

var nickidlist = {};

io.set('log level',2);

//���� ���� �̺�Ʈ�� �����մϴ�.

io.sockets.on('connection',function(socket){

	socket.on('systemIn',function(data){

		if(data.name)
		{
			//���� ����� ���̵�/�����ڵ� ����
			nicklist[data.name] = socket.nickname = data.name;
			nickidlist[data.name] = socket.id;
			io.sockets.emit('systemIn',data);
			io.sockets.emit('systemList',nicklist);
			console.log(data.name);
		}

	});
	socket.on('message',function(data){
		console.log(data);
		if(data.type == 'poblic')

		{			
//			io.sockets.emit('message',data);			
//			bot.say('#okjsp', "글 제목 : "+data.subject);
//			bot.say('#okjsp', "글 내용 : "+data.content);
			bot.say('#okjsp', "글 쓴이 : "+data.name);
		}

		else

		{
			//�ӼӸ� ó��
//			bot.say('#okjsp', data.message);
//			io.sockets.sockets[nickidlist[data.name]].emit('message',data);
//			io.sockets.sockets[nickidlist[data.type]].emit('message',data);
//			bot.say('#okjsp', "글 제목 : "+data.subject);
//			bot.say('#okjsp', "글 내용 : "+data.content);
			bot.say('#okjsp', "글 쓴이 : "+data.name);

		}

	});

	//���� ó��

	socket.on('disconnect',function(){

		if(socket.nickname){

			socket.broadcast.emit('systemOut',{name:socket.nickname});

			delete nicklist[socket.nickname];

			io.sockets.emit('systemList',nicklist);

		}

	});

});

