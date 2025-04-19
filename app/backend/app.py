from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/')
def home():
    return " Sunny is saying Hi from AKS"

@app.route('/products')
def products():
    ps_products = [
        {"id": 1, "name": "PlayStation 5", "price": 400},
        {"id": 2, "name": "PlayStation 5 Pro", "price": 600}
    ]
    return jsonify(ps_products)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)