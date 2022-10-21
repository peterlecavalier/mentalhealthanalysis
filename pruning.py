import pandas as pd
from label_parsing import label_parser
#import numpy as np
#import matplotlib.pyplot as plt

df = pd.read_csv('adult21.csv')

# threshold for null values
null_thresh = 0.1

pruned_df = df[df.columns[df.isnull().mean() < null_thresh]]

print(len(pruned_df.columns))
# Set up the label parser
lp = label_parser()

for i in pruned_df.columns:
    print(f"{i}: {lp.find_var_label(i)}")


