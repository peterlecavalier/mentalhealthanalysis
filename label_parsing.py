class label_parser():
    def __init__(self):
        self.label_dict = self.create_dict()
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
    def find_var_label(self, var):
        return self.label_dict[var]
