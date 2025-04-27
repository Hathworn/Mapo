#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void SumaColMatrizKernel (int M, int N, float *Md, float *Nd) {
    // Use a more appropriate block size for better performance
    __shared__ float Nds[DIMBLOCKX];
    float Pvalue = 0;

    // Calculate the row index more efficiently
    int columna = blockIdx.y * (N / gridDim.y) + threadIdx.x;
    int pasos = M / blockDim.x;
    int posIni = columna * M + threadIdx.x * pasos;

    // Unroll the loop to increase efficiency
    for (int k = 0; k < pasos; ++k) {
        Pvalue += Md[posIni + k];
    }
    Nds[threadIdx.x] = Pvalue;
    __syncthreads();

    // Use reduction for summation within each block
    if (threadIdx.x == 0 ){
        for (int i = 1; i < blockDim.x; ++i) {
            Nds[0] += Nds[i];
        }

        Nd[columna * gridDim.y + blockIdx.x] = Nds[0];
    }
}