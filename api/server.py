from flask import Flask,jsonify
# from flask_cors import CORS
app = Flask(__name__)
# CORS(app, resources={r"/admin": {"origins": "http://localhost:8080"}})
@app.route('/')
def index():
    return "Flask Api"

@app.route('/user')
def allUser():
    return ({
        'id': '001',
        'name':'user',
        'dob': '20-06-2024'
    })

@app.route('/admin')
def showAdmin():
    data = {
        "dob": "20-06-2024",
        "id": "000",
        "name": "Administrator"
    }
    response = jsonify(data)
    response.headers.add("Access-Control-Allow-Origin", "http://localhost:8080")
    return response


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)