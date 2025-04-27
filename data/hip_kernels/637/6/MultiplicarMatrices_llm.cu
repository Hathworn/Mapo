#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MultiplicarMatrices(float *m1, float *m2, float *mr, int columna1, int fila1, int columna2, int fila2)
{
    // Compute global row and column index
    int fila_r = blockIdx.y * blockDim.y + threadIdx.y;
    int columna_r = blockIdx.x * blockDim.x + threadIdx.x;

    // Initialize result accumulator
    float tmp_mult = 0;

    // Ensure indices are within bounds
    if (fila_r < fila2 && columna_r < columna1) {

        // Use shared memory to reduce global memory accesses
        __shared__ float shared_m1[/* appropriate size based on block */];
        __shared__ float shared_m2[/* appropriate size based on block */];

        // Load each stripe of both matrices into shared memory
        for (int i = 0; i < fila2; i += blockDim.y) {
            if (fila_r + i < fila2) {
                shared_m1[threadIdx.y] = m1[i + columna1 * (fila_r + i)];
                shared_m2[threadIdx.x] = m2[columna_r + columna2 * threadIdx.y];
            }
            __syncthreads();
            
            // Compute partial result using shared memory
            for (int j = 0; j < blockDim.y; ++j) {
                tmp_mult += shared_m1[j] * shared_m2[j];
            }
            __syncthreads();
        }

        // Store accumulated result to output matrix
        mr[fila_r * columna2 + columna_r] = tmp_mult;
    }
}