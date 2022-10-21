from bdb import effective


class label_parser():
    def __init__(self):
        self.label_dict = self.create_dict()
        self.groups = self.create_groups()
        #self.desc_groups = [self.find_var_label(i) for i in self.gro]
    def create_dict(self):
        f = open('adult.sas', 'r')
        lines = f.readlines()

        label_dict = {}

        found_beginning = False
        for line in lines:
            if not found_beginning:
                if '/* set variable labels */' in line:
                    found_beginning = True
            else:
                if '=' in line:
                    equal_idx = line.strip().replace(' ', '').find('=')
                    var = line.strip().replace(' ', '')[:equal_idx]
                    equal_idx = line.find('=')
                    label = line[equal_idx + 3:-2]
                    label_dict[var] = label
                elif ';' in line:
                    break

        return label_dict
    def create_groups(self):
        f = open('adult.sas', 'r')
        lines = f.readlines()
        
        groups = []

        cur_group = []
        found_beginning = False
        for line in lines:
            if not found_beginning:
                if 'Associate variables' in line:
                    found_beginning = True
            else:
                if "/*" in line and "*/" in line:
                    groups.append(cur_group)
                    cur_group = []
                elif ";" in line:
                    groups.append(cur_group)
                    break
                elif line.strip().replace(' ', '') != '':
                    split_line = line.strip().split(' ')
                    split_line = [i for i in split_line if i != '']
                    for i in range(0, len(split_line), 2):
                        cur_group.append(split_line[i])

        return groups[1:]
    def find_var_label(self, var):
        return self.label_dict[var]
    def var_groups(self):
        '''
        Returns a nested list of groupings of variables
        '''
        return self.groups
    def desc_groups(self):
        '''
        Returns a nested list of groupings of variables
        '''
        desc_groupings = []
        cur_group = []
        for i in self.groups:
            for j in i:
                cur_group.append(self.find_var_label(j))
            desc_groupings.append(cur_group)
            cur_group = []
        return desc_groupings