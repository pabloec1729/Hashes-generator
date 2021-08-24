# MAIN FUNCTION
from micro_ucr_hash import micro_ucr_hash
from generador_nonce import generador_nonce
from comparador import comparador
from concatenador import concatenador
from salidas import salidas


def sistema(entradas, inicio, nonce_size, target):

   
    entrada = entradas.pop()  #tomando la primera entrada

    
    while inicio == 1:
      
        print("\nEntrada de 12 bytes:")
        print(entrada)
        nonce = generador_nonce(nonce_size)

       
        print("\nNonce generado aleatoriamente para ser probado:")
        print(hex(nonce[0]))
        print(hex(nonce[1]))
        print(hex(nonce[2]))
        print(hex(nonce[3]))
        print(nonce)
        secuencia = concatenador(entrada, nonce)

        
        print("\nSecuencia concatenada:")
        print(secuencia)

        hash_out = micro_ucr_hash(secuencia)
       
        print("\nSalida de la funcion micro_hash:")
        print(hash_out)

        print("\nTarget:")
        print(target)

        valid_out = comparador(hash_out, target)
     
        print("\nComparacion aprobada = 1, Comparacion fallida = 0:")
        print(valid_out)

        fin = salidas(valid_out, nonce)

        if fin:
            if not entradas:
                print("Lista vacia")
                return 0

            entrada = entradas.pop()
           
            print("\n----------------------------------------------------------------------------------------\n")
            print("Nueva entrada")

    return "Salidas en cero", 0



entradas = [[0x67, 0xee, 0x4f, 0x2f, 0x45, 0xca, 0x9e, 0x6c, 0x6b, 0x1a, 0x33, 0x24],
            [0xed, 0x18, 0xbe, 0x0f, 0x98, 0x4a, 0xe0, 0xe2, 0xe3, 0x12, 0x8e, 0xfe],
            [0xa8, 0x55, 0xc7, 0xa2, 0x8b, 0x73, 0xf8, 0xf2, 0x97, 0xa1, 0xef, 0xf1],
            [0x09, 0x71, 0xfd, 0x32, 0xbd, 0xd9, 0xb8, 0x72, 0xdb, 0xe6, 0x1c, 0xf7],
            [0xf5, 0xa1, 0xaa, 0x46, 0xae, 0x1e, 0xa2, 0xd1, 0x11, 0xad, 0xd7, 0x16]]

sistema(entradas, 1, 4, 50)
