from label_parsing import label_parser

lp = label_parser()

# List of lists of group DESCRIPTIONS
desc_groups = lp.desc_groups()

# List of lists of group VARIABLE NAMES
var_groups = lp.var_groups()

for i in desc_groups:
    print(i)