def salidas(valid, nonce):

    fin = True
    if valid == 1:
        print("\nCondicion cumplida, nonce valido:")
        print(nonce)
    else:
        print("\nNo se cumplió la condición, nueva iteración.")
        fin = False
    return fin
