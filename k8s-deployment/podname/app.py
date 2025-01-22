from flask import Flask
import os

app = Flask(__name__)

@app.route('/')
def get_pod_name():
    # Get the pod name from the HOSTNAME environment variable
    pod_name = os.getenv('HOSTNAME', 'Unknown Pod')
    return f"""
    <html>
        <head>
            <style>
                body {{
                    background-color: blue;
                    color: white;
                    font-family: Arial, sans-serif;
                    text-align: center;
                    padding-top: 50px;
                }}
                h1 {{
                    font-size: 2.5em;
                }}
            </style>
        </head>
        <body>
            <h1>Hello from Kishalay</h1><br>
            <h2>Pod Name: {pod_name}</h2>
        </body>
    </html>
    """

if __name__ == '__main__':
    # Run the app on port 5000 by default
    app.run(host='0.0.0.0', port=5000)
