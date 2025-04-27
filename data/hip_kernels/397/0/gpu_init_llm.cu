```c
#include "hip/hip_runtime.h"
#include "includes.h"

/**
* Estructura antena
*/
typedef struct {
    int y;
    int x;
} Antena;

/**
* Macro para acceder a las posiciones del mapa
*/
#define m(y,x) mapa[ (y * cols) + x ]

/**
* Definimos el tamaño de bloque
*/
#define TAMBLOCK 128

/**
* Inicializa el mapa con el valor máximo
*/
__global__ void gpu_init(int *mapad, int max, int size) {
    int position = blockIdx.x * blockDim.x + threadIdx.x + 
                   blockIdx.y * blockDim.y * gridDim.x + threadIdx.y * gridDim.x * blockDim.x;

    // Only initialize positions within the map size
    if (position < size) {
        mapad[position] = max;
    }
}