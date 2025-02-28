from mol2chemfigPy3 import mol2chemfig

# Llista de molècules en format SMILES
smiles_list = [
    'C1=CC=C(C=C1)O',   # Fenol
    'CCO',               # Etanol
    'CC(=O)O',           # Àcid acètic
    'CCN(CC)CC',         # Dietilamina
    'C1=CC=CC=C1',        # Benzè
    'C1CN1',        # aziridina
    'NC=C',         #etenamina
    'CC=N'          #etanimina

]

# Iterar sobre cada SMILES i convertir-lo a ChemFig
for smiles in smiles_list:
    print(f'\nSMILES: {smiles}')
    chemfig_code = mol2chemfig(smiles)
