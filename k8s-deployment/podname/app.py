from flask import Flask
import os
import socket

app = Flask(__name__)

@app.route('/')
def get_pod_details():
    pod_name = os.getenv('HOSTNAME', 'Unknown Pod')
    pod_ip = socket.gethostbyname(socket.gethostname())

    return f"""
    <html>
        <head>
            <style>
                body {{
                    background-color: green;
                    color: white;
                    font-family: Arial, sans-serif;
                    text-align: center;
                    padding-top: 50px;
                }}
                h1 {{
                    font-size: 2.5em;
                }}
                h2 {{
                    margin-top: 20px;
                }}
            </style>
        </head>
        <body>
            <h1>Hello from Kishalay v2</h1>
            <h2>Pod Name: {pod_name}</h2>
            <h2>Pod IP: {pod_ip}</h2>
        </body>
    </html>
    """

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
