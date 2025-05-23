#include "hip/hip_runtime.h"
#include "includes.h"

//Bibliotecas Basicas

//Biblioteca Thrust

//Biblioteca cuRAND

//PARAMETROS GLOBAIS
const int QUANT_PAIS_AVALIA = 4;
int POP_TAM = 200;
int N_CIDADES = 20;
int BLOCKSIZE = 1024;
int TOTALTHREADS = 2048;
int N_GERA = 100;
const int MUT = 10;
const int MAX = 19;
const int MIN = 0;
const int ELITE = 2;

/*
* Preenche os genes de cada indivíduo na população
*/
__global__ void preencheGenes(unsigned int n, unsigned int np, int* genes)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Looping to fill genes based on index and stride
    for (int i = index; i < n; i += stride) {
        int offset = i * np;
        for (int j = 0; j < np; j++) {
            genes[offset + j] = j; // Assigning genes efficiently
        }
    }
}