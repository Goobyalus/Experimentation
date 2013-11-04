#S -> (S)
#S -> e

#does not function

class Node:
    def __init__(self, name, child = None):
        self.name = name
        self.child = child

def parse_S(str):
    if(str[0] != '('):
        return 'epsilon'
    elif(str[0] == '('):
        temp = parse_S(str[1:])
        if(str[0] == ')'):
            return Node("Parentheses",temp)
        else:
            raise Exception('invalid input')
    
            
            