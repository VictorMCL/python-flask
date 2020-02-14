from flask import Flask
app = Flask(__name__)

@app.route('/sumar/<a>/<b>')
def sumar(a=1,b=2):
    a=int(a)
    b=int(b)
    c = a+b
    return str(c)

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
