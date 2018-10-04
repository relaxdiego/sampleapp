import os


from flask import Flask, jsonify, render_template
app = Flask(__name__)

hits = 0
VERSION = 2


@app.route('/')
def index():
    return render_template('index.html')


@app.route('/api')
def api():
    global hits
    hits += 1

    payload = {
        'version': VERSION,
        'pod_name': os.environ.get('MY_POD_NAME', ''),
        'pod_ip': os.environ.get('MY_POD_IP', ''),
        'node_name': os.environ.get('MY_NODE_NAME', ''),
        'hits': hits
    }

    return jsonify(payload)
