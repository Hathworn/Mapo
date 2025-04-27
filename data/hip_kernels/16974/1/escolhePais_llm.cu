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
* Busca por erros nos processos da gpu
*/
__global__ void escolhePais(unsigned int n, unsigned int np, int *paisAle, double *fitness, int *pool) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Iterate over elements assigned to this thread
    for (int i = index; i < n; i += stride) {
        // Initialize best fitness to a large number
        double best = 10000.0;
        int best_index = -1;

        // Find the best candidate among QUANT_PAIS_AVALIA options
        for (int j = 0; j < QUANT_PAIS_AVALIA; j++) {
            int idx = paisAle[i * QUANT_PAIS_AVALIA + j];
            if (fitness[idx] < best) {
                best = fitness[idx];
                best_index = idx;
            }
        }
        // Store the best index in the pool
        if (best_index != -1) {
            pool[i] = best_index;
        }
    }
}