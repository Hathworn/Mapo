#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scal_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate the global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int gridSize = gridDim.x * blockDim.x;

    // Loop over all elements assigned to each thread
    while (i < N) {
        X[i * INCX] *= ALPHA;
        i += gridSize; // Move to the next element the thread will process
    }
}