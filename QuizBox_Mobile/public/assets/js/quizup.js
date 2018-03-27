$(() => {
	let socket = io()

	$('a#room').on('click', (e) => {
		e.preventDefault()
		let channel_id = $(e.currentTarget).attr('quizup-data')
		socket.emit('enterChannel', channel_id)
		return false
	})

	socket.on('inChannel', (channel_id) => {
		$('#password').remove()
		
		$('#ready').append(
			$('<button type="submit" id="readyBtn" name="ready">Ready</button>')
				.on('click', (e) => {
					socket.emit('sendReady', {
						channel_id,
					})
				})
		)
	})

	socket.on('channelNotFound', (msg) => {
		alert(msg)
	})

	socket.on('clientNotFound', (msg) => {
		alert(msg)
	})

	socket.on('channelFull', (msg) => {
		alert(msg)
	})

	socket.on('wrongPassword', (msg) => {
		alert(msg)
	})

	socket.on('passwordNeeded', (channel_id) => {
		$('#password')
			.append(
				$(`<input type="password" id="pwd" name="pwd" placeholder="Password...">`)
			)
			.append(
				$('<button type="submit" id="sendPwd" name="sendPwd">Send</button>')
					.on('click', (e) => {
						socket.emit('sendPasswordChannel', {
							channel_id,
							pwd: $('input#pwd').val()
						})
					})
			)
	})

	socket.on('question', (question) => {
		$('#ready').remove()

		$('#question').append(
			$('<p>' + question.question + '</p>')
		)

		question.answers.forEach((v, k) => {
			$('#answers').append(
				$('<p>' + v.answer + '</p>')
			)
		})
	})
})