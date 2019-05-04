# About - Cuckoo Tales

Simple bash script that downloads and extracts mp3 from youtube videos and uploads it to a Telegram channel.

Telegram can be used as a music player substitute. It is kind of cool and handy feature of Telegram.

License: WTFPL ![WTFPL LOGO](http://www.wtfpl.net/wp-content/uploads/2012/12/wtfpl-badge-1.png)

# Dependencies

1. [youtube-dl](https://github.com/ytdl-org/youtube-dl)  
2. ffmpeg  

It uses `youtube-dl` to download and extract audio from youtube videos. It also requires `ffmpeg` for the conversion.

# Usage

1. Create a Telegram bot using Botfather. Details can be found [here](https://core.telegram.org/bots#3-how-do-i-create-a-bot]).  
2. Create a Telegram channel or group and get the chat id.  
3. If you are using a channel, make the bot administrator of that channel.  
4. Add the bot-token and chat ID in the config file.  

It is simple to use:  
`./cuckoo.sh <youtube-link-here>`  

# [Subscribe to my channel here](https://t.me/cuckootales)

