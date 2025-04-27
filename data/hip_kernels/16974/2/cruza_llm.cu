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
__global__ void cruza(unsigned int n, unsigned int np, int *cidadesAle, int *pop, int *newPop, int *poolPais, int *mutacoes) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Processing in stride to handle larger arrays
    for (int i = index; i < n; i += stride) {
        int paiA = poolPais[i];
        int paiB = poolPais[i + 1];
        int copiaPai = cidadesAle[i * 4];
        int crossover = cidadesAle[(i + 1) * 4] % np;
        int mutar = cidadesAle[(i + 2) * 4];
        int pontoMutar = cidadesAle[(i + 3) * 4] % np;

        // Copy elite parents directly
        if (copiaPai < ELITE) {
            for (int j = 0; j < np; j++) {
                newPop[i * np + j] = pop[paiA * np + j];
            }
            continue;  // Skip crossover and mutation for elite
        }

        // Initial copy from parent A
        for (int j = 0; j < np; j++) {
            newPop[i * np + j] = pop[paiA * np + j];
        }

        // Perform crossover from parent B
        int crossoverEnd = min(crossover + mutacoes[i], MAX);
        for (int j = crossover; j < crossoverEnd; j++) {
            int t = 0;
            while (newPop[i * np + t] != pop[paiB * np + j]) {
                t++;
            }
            // Swap elements
            int aux = newPop[i * np + j];
            newPop[i * np + j] = newPop[i * np + t];
            newPop[i * np + t] = aux;
        }

        // Perform mutation if necessary
        if (mutar < MUT) {
            int mut = clamp(mutacoes[i], MIN, MAX);
            int t = 0;
            while (newPop[i * np + t] != mut) {
                t++;
            }
            // Swap elements for mutation
            int aux = newPop[i * np + pontoMutar];
            newPop[i * np + pontoMutar] = newPop[i * np + t];
            newPop[i * np + t] = aux;
        }
    }
}
