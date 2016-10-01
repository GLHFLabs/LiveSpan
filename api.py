from flask import Flask, request
from sc2replay_converter import main as convert
import subprocess

app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = "/usr/local/app/tmp"

subprocess.run("python sc2replay_converter.py replays/ 600 30")

@app.route('/balance', methods = 'POST')
def balance:
    f = request.files["replay"]
    filename = secure_filename(f.filename)
    f.save("/usr/local/app/tmp/" + filename)
    subprocess.run("./BalanceSpan ")
