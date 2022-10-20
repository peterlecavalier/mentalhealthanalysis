import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

df = pd.read_csv('adult21.csv')
sns.relplot(data = df, x = 'HEIGHTTC_A', y = 'LSATIS4R_A', col = 'SEX_A')
plt.show()