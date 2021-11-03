#!/work/00/gp27/share/local/miniconda3/bin/python
import sys
import numpy as np
from numpy.linalg import norm

if __name__ == '__main__':
    args = sys.argv
    if 2 <= len(args):
        vec = np.array(args[1:])
        print('Vector:', vec)
        print('L2 norm;', norm(vec, ord=2))
    else:
        print('Arguments are too short')
