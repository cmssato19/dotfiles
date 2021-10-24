#!/usr/bin/env python3
#
# soaip2cif.py
#   2020/05/09 T. Yamashita
#
import argparse

import numpy as np
from pymatgen import Structure
from pymatgen.io.cif import CifWriter
from pymatgen.core.units import LengthArray
from pymatgen.symmetry.analyzer import SpacegroupAnalyzer


def get_atomlist(atype, nat):
    '''
    e.g. Na2Cl2
    atomlist = ['Na', 'Na', 'Cl', 'Cl']
    '''
    atomlist = []
    for i in range(len(atype)):
        atomlist += [atype[i]]*nat[i]
    return atomlist


def from_file(name, natot, atomlist):
    # ---------- last structure
    with open(name, 'r') as f:
        lines = f.readlines()
    lines = lines[-(natot+5):]

    # ---------- check
    if not 'unit vectors' in lines[0]:
        raise ValueError('Probably number of atoms is wrong')

    # ---------- lattice
    lattice = [[float(x) for x in line.split()] for line in lines[1:4]]
    #     in Bohr, each column is a lattice vector
    lattice = np.array(LengthArray(lattice, 'bohr').to('ang'))  # Bohr --> Ang
    lattice = lattice.T    # now each row is a lattice vector

    # ---------- internal coordinates
    coords = [[float(x) for x in line.split()] for line in lines[5:]]

    # ---------- pymatgen structure
    structure = Structure(lattice, atomlist, coords)

    return structure


if __name__ == '__main__':
    '''
    log.struc to cif
    '''
    # ---------- argparse
    parser = argparse.ArgumentParser()
    parser.add_argument('-t', '--type', help='atom type', nargs='*', required=True)
    parser.add_argument('-n', '--number', help='number of atom', type=int, nargs='*', required=True)
    parser.add_argument('-s', '--symmetrized', help='flag for symmetrized structure', action='store_true')
    parser.add_argument('-i', '--infile', help='input file', default='log.struc')
    parser.add_argument('-o', '--outfile', help='output file', default='soiap_out.cif')
    args = parser.parse_args()

    # ---------- atom info
    natot = sum(args.number)    # total number of atoms
    atomlist = get_atomlist(args.type, args.number)

    # ---------- get structure
    struc = from_file(args.infile, natot, atomlist)

    # ---------- write cif
    if args.symmetrized:
        cw = CifWriter(struc, symprec=0.1)
    else:
        cw = CifWriter(struc, symprec=None)
    cw.write_file(args.outfile)
