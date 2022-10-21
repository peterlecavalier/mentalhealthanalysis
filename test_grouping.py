from label_parsing import label_parser

lp = label_parser()

groups = lp.desc_groups()
for i in groups:
    print(i)
#print(lp.desc_groups())