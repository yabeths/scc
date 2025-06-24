# app.py

from flask import Flask, render_template

# Initialize the Flask application
app = Flask(__name__)

# Route for the Home page
@app.route('/')
def home():
    # Flask uses render_template to render an HTML file from the templates folder
    return render_template('home.html')

# Route for the About page
@app.route('/about')
def about():
    return render_template('about.html')

# Route for the Contact page
@app.route('/contact')
def contact():
    return render_template('contact.html')

# Run the Flask application
if __name__ == '__main__':
    # debug=True enables auto-reload and debug information
    app.run(debug=True)

"""
Flask routing works by binding functions to URLs using decorators like @app.route.
Each function defines what happens when a user visits a specific URL path.
The render_template function loads an HTML file from the 'templates' directory and returns it as a response.
"""
# app.py

from flask import Flask, render_template

# Initialize the Flask application
app = Flask(__name__)

# Route for the Home page
@app.route('/')
def home():
    # Flask uses render_template to render an HTML file from the templates folder
    return render_template('home.html')

# Route for the About page
@app.route('/about')
def about():
    return render_template('about.html')

# Route for the Contact page
@app.route('/contact')
def contact():
    return render_template('contact.html')

# Run the Flask application
if __name__ == '__main__':
    # debug=True enables auto-reload and debug information
    app.run(debug=True)

"""
Flask routing works by binding functions to URLs using decorators like @app.route.
Each function defines what happens when a user visits a specific URL path.
The render_template function loads an HTML file from the 'templates' directory and returns it as a response.
"""
