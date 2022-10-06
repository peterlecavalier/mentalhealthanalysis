import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

df = pd.read_csv('adult21.csv')
#print(df.head())
print(df['ASPMEDSTP_A'].value_counts())

# threshold for null values
null_thresh = 0.1

x = np.arange(0.0, 1.0, 0.01)
y = []
for i in x:
    pruned_df = df[df.columns[df.isnull().mean() < i]]
    y.append(len(pruned_df.columns))

plt.plot(x, y)
plt.show()