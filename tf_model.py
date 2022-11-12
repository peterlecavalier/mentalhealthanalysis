import numpy as np
import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
print(tf.__version__)
import warnings
warnings.filterwarnings("ignore")

df = pd.read_csv('adult21.csv')

df = df[['WEIGHTLBTC_A', 'CITZNSTP_A', 'NATUSBORN_A', 'FDSCAT3_A', 
'EMPWRKLSW1_A', 'INCWRKO_A', 'HOUTENURE_A', 'SUPPORT_A', 'SMKEV_A', 
'CIGAREV_A', 'AFVET_A', 'INCINTER_A', 'ECIGEV_A', 'SCHCURENR_A',
'MARITAL_A', 'PIPEEV_A',
'LSATIS11R_A']]
'''
WEIGHTLBTC_A:
    -> 100-299 = 100-299 pounds
    -> 997 = Refused
    -> 999 = Don't Know
CITZNSTP_A:
    -> 1 = Yes, a citizen of the US
    -> 2 = No, not a citizen of the US
    -> 7 = Refused
    -> 9 = Don't Know
NATUSBORN_A:
    -> 1 = Yes
    -> 2 = No
    -> 7 = Refused
    -> 9 = Don't Know
FDSCAT3_A:
    -> 1 = Food secure
    -> 2 = Low food security
    -> 3 = Very low food security
EMPWRKLSW1_A (worked last week):
    -> 1 = Yes
    -> 2 = No
    -> 9 = Don't Know
INCWRKO_A (Income from wages):
    -> 1 = Yes
    -> 2 = No
    -> 7 = Refused
    -> 9 = Don't Know
HOUTENURE_A (Residence):
    -> 1 = Owned or being bought
    -> 2 = Rented
    -> 3 = Other arrangement
    -> 7 = Refused
    -> 9 = Don't Know
SUPPORT_A (How often get social/emotional support you need):
    -> 1 = Always
    -> 2 = Usually
    -> 3 = Sometimes
    -> 4 = Rarely
    -> 5 = Never
    -> 7 = Refused
    -> 9 = Don't Know
SMKEV_A (Ever smoked 100 cigarettes):
    -> 1 = Yes
    -> 2 = No
    -> 7 = Refused
    -> 9 = Don't Know
CIGAREV_A (Ever smoked a cigar):
    -> 1 = Yes
    -> 2 = No
    -> 7 = Refused
    -> 9 = Don't Know
AFVET_A (Ever serve active duty military):
    -> 1 = Yes
    -> 2 = No
    -> 7 = Refused
INCINTER_A (Income from accounts):
    -> 1 = Yes
    -> 2 = No
    -> 7 = Refused
    -> 9 = Don't Know
ECIGEV_A (Ever used e-cigs):
    -> 1 = Yes
    -> 2 = No
    -> 7 = Refused
    -> 9 = Don't Know
SCHCURENR_A (Currently in school):
    -> 1 = Yes
    -> 2 = No
    -> 7 = Refused
    -> 9 = Don't Know
MARITAL_A:
    -> 1 = Married
    -> 2 = Living w/ partner, unmarried
    -> 3 = Neither
    -> 7 = Refused
    -> 9 = Don't Know
PIPEEV_A (Smoked a pipe filled with tobacco):
    -> 1 = Yes
    -> 2 = No
    -> 7 = Refused
    -> 9 = Don't Know
LSATIS11R_A (Life Satisfaction):
    -> 0-10:
    Using a scale of 0 to 10, where 0 means "very dissatisfied" and 10 means "very
    satisfied", how do you feel about your life as a whole these days?
'''

print(df.shape)
# Drop missing values for each of our columns
'''
df = df.drop(df[(df['WEIGHTLBTC_A'] == 996) | (df['CITZNSTP_A'] == 8)
| (df['NATUSBORN_A'] == 8) | (df['FDSCAT3_A'] == 8) | (df['INCWRKO_A'] == 8)
| (df['HOUTENURE_A'] == 8) | (df['SUPPORT_A'] == 8) | (df['SMKEV_A'] == 8)
| (df['CIGAREV_A'] == 8) | (df['AFVET_A'] == 8) | (df['INCINTER_A'] == 8)
| (df['ECIGEV_A'] == 8) | (df['SCHCURENR_A'] == 8) | (df['MARITAL_A'] == 8)
| (df['PIPEEV_A'] == 8)
| (df['LSATIS11R_A'] > 10)].index)
'''


df = df.drop(df[(df['WEIGHTLBTC_A'] > 300) | (df['CITZNSTP_A'] > 2)
| (df['NATUSBORN_A'] > 2) | (df['FDSCAT3_A'] == 8) | (df['INCWRKO_A'] > 2)
| (df['HOUTENURE_A'] > 3) | (df['SUPPORT_A'] > 5) | (df['SMKEV_A'] > 2)
| (df['CIGAREV_A'] > 2) | (df['AFVET_A'] > 2) | (df['INCINTER_A'] > 2)
| (df['ECIGEV_A'] > 2) | (df['SCHCURENR_A'] > 2) | (df['MARITAL_A'] > 3)
| (df['PIPEEV_A'] > 2)
| (df['LSATIS11R_A'] > 10)].index)



print(df.shape)

train, test = train_test_split(df, test_size=0.2)

# Get the correct columns for training
train_x = train.drop('LSATIS11R_A', axis=1)
train_y = train['LSATIS11R_A']

test_x = test.drop('LSATIS11R_A', axis=1)
test_y = test['LSATIS11R_A']

# Setting up our network for multi-class classification

# Activation function to use for our inner layers
act = 'relu'


inputs = keras.Input(shape=(16,), dtype=tf.int16)
'''
dense1 = layers.Dense(32, activation=act)
x = dense1(inputs)
x = layers.Dense(64, activation=act)(x)
x = layers.Dense(128, activation=act)(x)
x = layers.Dense(64, activation=act)(x)
x = layers.Dense(32, activation=act)(x)
outputs = layers.Dense(11)(x)
'''

dense1 = layers.Dense(32, activation=act)
x = dense1(inputs)
outputs = layers.Dense(11, activation='softmax')(x)

model = keras.Model(inputs=inputs, outputs=outputs, name="mentalhealth_model")

model.summary()

model.compile(optimizer='adam',
                loss=tf.keras.losses.SparseCategoricalCrossentropy(from_logits=True),
                metrics=['accuracy'])

model.fit(train_x, train_y, epochs=10, batch_size=2)


