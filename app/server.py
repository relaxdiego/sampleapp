import os

from flask import Flask, render_template
app = Flask(__name__)


hits = 0
VERSION = 2


@app.route('/')
def index():
    return render_template('index.html')


@app.route('/data')
def data():
    global hits
    hits += 1

    data = {
        'version': VERSION,
        'pod_name': os.environ.get('MY_POD_NAME', ''),
        'pod_ip': os.environ.get('MY_POD_IP', ''),
        'node_name': os.environ.get('MY_NODE_NAME', ''),
        'hits': hits
    }

    return render_template('table.html', **data)
