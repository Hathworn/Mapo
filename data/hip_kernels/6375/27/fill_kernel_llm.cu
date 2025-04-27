#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized fill_kernel
__global__ void fill_kernel(int N, float ALPHA, float *X, int INCX)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Simplified linear index calculation
    int stride = gridDim.x * blockDim.x; // Calculate stride for looping over elements
    
    for (int i = idx; i < N; i += stride) { // Use loop to process multiple elements
        X[i*INCX] = ALPHA;
    }
}