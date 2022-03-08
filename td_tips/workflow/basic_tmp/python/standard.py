import os
import sys
import requests
import csv
import re
import time
import timeit
os.system(f"{sys.executable} -m pip install --upgrade pytd==1.4.0")

import numpy as np
import scipy as sp
import pandas as pd

import sklearn
from sklearn.cluster import KMeans
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder
from sklearn.metrics import accuracy_score, recall_score, confusion_matrix ,precision_score, f1_score
import lightgbm as lgb

import pytd
def preprocessing(database_name, table_name):  
    client = pytd.Client(apikey = os.environ["TD_API_KEY"]\
                        ,endpoint='https://api.treasuredata.co.jp'\
                        ,default_engine='presto'
                        )
    query = client.query('SELECT * FROM your_database_name.your_table_name')
    df = pd.DataFrame(**query)

    client.load_table_from_dataframe(df, 'your_database_name.your_table_name', writer='bulk_import', if_exists='overwrite')
