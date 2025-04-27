#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixFunc(float *F, int size)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x + 1;
    int j = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Ensure indices are within bounds
    if (i < size && j < size - 1) {
        // Loop unrolling and leveraging thread parallelism
        #pragma unroll
        for(int k = 0; k < 100; k++) {
            F[i * size + j] = F[(i-1) * size + j + 1] + F[i * size + j + 1];
        }
    }
}