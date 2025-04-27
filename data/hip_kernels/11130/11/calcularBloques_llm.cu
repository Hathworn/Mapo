#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calcularBloques(int *matriz, int *u, int *resultado, int num_bloques, int nc, int m ){
    int index1 = threadIdx.x + blockIdx.x * blockDim.x;
    int index2 = threadIdx.y + blockIdx.y * blockDim.y;

    // Optimize using register for suma
    register int suma;

    for (int i = 0; i < num_bloques; i++) {
        suma = 0;
        int base_index = index1 * nc;
        int u_base_index = index2 + m * i * nc;
        for (int l = 0; l < nc; l++) {
            suma += matriz[base_index + l] * u[u_base_index + m * l];
        }
        resultado[u_base_index + m * index1] = suma;
    }
}