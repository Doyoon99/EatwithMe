import numpy as np
import pandas as pd
from flask import Flask, request
from tensorflow.python.keras.models import model_from_json
import json

import urllib.request

app = Flask(__name__)

def load_model(name):
  # load json and create model
  model_file = open('{}.json'.format(name), 'r')
  loaded_model_json = model_file.read()
  model_file.close()
  loaded_model = model_from_json(loaded_model_json)
  # load weights into new model
  loaded_model.load_weights("{}.h5".format(name))
  print("Loaded model from disk")
  return loaded_model

@app.route('/tospring', methods=['GET', 'POST'])
def recommend_item():

    input_json = request.get_json()
    #print(input_json)
    item_data = pd.read_csv('./data/item_data.csv')

    #json_sample_data = json.loads(input_json)
    item_idx = input_json['item']
    rating_idx = input_json['rating']

    data = np.zeros((1, 233))

    for item, rating in zip(item_idx, rating_idx):
        data[:, item] = rating

    model = load_model('./model/autorec0527')

    predict_value = model.predict(data)

    idx = np.argpartition(predict_value.reshape(-1), -5)[-5:]

    rec_item = [item_data[item_data['ItemID_int'] == i]['ItemID'].item() for i in idx]

    print(rec_item)

    return json.dumps({"item":rec_item}, ensure_ascii = False)


if __name__ == '__main__':
    app.run(debug=False, host="127.0.0.1", port=5000)
