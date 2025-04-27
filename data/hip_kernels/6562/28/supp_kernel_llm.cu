#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void supp_kernel(int N, float ALPHA, float *X, int INCX)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplify block index calculation
    int stride = gridDim.x * blockDim.x; // Calculate the total number of threads

    for (; i < N; i += stride) { // Use a stride loop to cover all elements
        float val = X[i * INCX]; // Cache X[i*INCX] to reduce repeated computation
        if (val * val < ALPHA * ALPHA) 
            X[i * INCX] = 0;
    }
}