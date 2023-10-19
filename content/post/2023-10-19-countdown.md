---
title: "A Countdown Timer"
date: "2023-10-19"
author: "Xiong Nao"
tags: [python, countdown, clock, timer]
categories:
    - post
---
Inspired by a macro in **Keyboard Maestro**, I asked ChatGPT to create a simple countdown timer in Python. 

To use it, save the script as `show_countdown.py`, then simply run the script with an integer (how many minutes to count down) like:

```python
python show_countdown.py 5 # 5 minutes countdown timer
```

The script is:

```python
import webbrowser

def show_countdown(minutes):
    html_content = f'''
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Countdown Timer</title>
        <style>
            body {{
            	font-family: Fira Mono, Monaco, Menlo, monospace;
            	font-size: 10em;
                font-weight: bold;
                text-align: center;
                background-color: aliceblue;
                transition: background-color 0.5s;
            }}
        </style>
    </head>
    <body>
        <div id="countdown"></div>

        <script>
	    
            function startCountdown(minutes) {{
                var countdownElement = document.getElementById('countdown');
                var totalSeconds = minutes * 60;
                var countdownInterval = setInterval(function() {{
                    var minutes = Math.floor(totalSeconds / 60);
                    var seconds = totalSeconds % 60;
                    countdownElement.innerHTML = (minutes < 10 ? '0' : '') + minutes + ':' + (seconds < 10 ? '0' : '') + seconds;

                    if (totalSeconds <= 0) {{
                        clearInterval(countdownInterval);
                        countdownElement.innerHTML = 'xxx!';
                        document.body.style.backgroundColor = 'pink';
                    }} else {{
                        totalSeconds--;
                    }}
                }}, 1000);
            }}

            var minutes = {minutes};
            startCountdown(minutes);
        </script>
    </body>
    </html>
    '''

    with open('countdown.html', 'w') as f:
        f.write(html_content)

    webbrowser.open('countdown.html')

if __name__ == '__main__':
    import sys

    if len(sys.argv) != 2:
        print('Usage: python show_countdown.py <minutes>')
        sys.exit(1)

    try:
        minutes = int(sys.argv[1])
        show_countdown(minutes)
    except ValueError:
        print('Please provide a valid integer for the number of minutes.')

```
