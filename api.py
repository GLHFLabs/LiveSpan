from flask import Flask, request
from sc2replay_converter import main as convert

app = Flask(__name__)

@app.route('/balance', methods = 'POST')
def balance: pass
#call to convert etc.
