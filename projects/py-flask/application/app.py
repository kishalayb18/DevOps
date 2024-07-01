from flask import Flask, request, redirect, render_template
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///data/names.db'
db = SQLAlchemy(app)

class Name(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)

@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        name = request.form['name']
        if name:
            new_name = Name(name=name)
            db.session.add(new_name)
            db.session.commit()
            return redirect('/')
    names = Name.query.all()
    return render_template('index.html', names=names)

if __name__ == "__main__":
    db.create_all()
    app.run(host='0.0.0.0', port=5000)
