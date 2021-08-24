import os
def generador_nonce(size):
    nonce = []
    for i in range(size):
        newbyte = os.urandom(1)
        newbyte = int.from_bytes(newbyte, "big")
        nonce.append(newbyte)
    return nonce