from flask import Flask, request, render_template

app = Flask(__name__) # creates the Flask application

USER_FILE = "data/users.txt"

@app.route('/login', methods=['GET', 'POST']) # methods=['GET', 'POST'] allows both request types
# The function returns text shown in the browser
# GET request shows the form in the browser
# POST request reads submitted form data using request.form
def login():
    if request.method == 'POST':
        name = request.form['username']
        with open(USER_FILE,"w") as f:
            f.write(name)
        return f"Hello {name}, POST request received"
    return render_template('name.html') # render_template() displays the HTML form

if __name__ == '__main__':
    app.run(debug=True) # starts the local server debug=True helps during development
