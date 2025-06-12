from flask import Flask, render_template, request
import pandas as pd
import matplotlib.pyplot as plt
import os

app = Flask(__name__)

@app.route('/', methods=['GET', 'POST'])
def index():
    stats = None
    if request.method == 'POST':
        file = request.files['file']
        if file.filename.endswith('.csv'):
            df = pd.read_csv(file)
            stats = df.describe().to_html(classes='table table-striped')

            # Buat plot
            plt.figure(figsize=(8, 5))
            df.hist(figsize=(10, 6))
            plt.tight_layout()
            plt.savefig('static/plot.png')
            plt.close()

    return render_template('index.html', stats=stats)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
