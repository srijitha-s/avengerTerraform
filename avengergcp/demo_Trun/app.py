from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    #target = os.environ.get('TARGET','HELLO  WORLD!!!')
    #return 'hello {}!\n'.format(target)
    return "Hello terraform"

if __name__ == "__main__":
    #app.run(debug=True,host='127.0.0.1',port=int(os.environ.get('PORT',8080)))
    app.run(debug=True,host='127.0.0.1',port=8080)