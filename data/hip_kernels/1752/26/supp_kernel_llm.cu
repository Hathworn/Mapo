#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void supp_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate the global index once for reuse
    int index = i * INCX;
    
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation
    if(i < N) {
        float val = X[index]; // Load value once
        if((val * val) < (ALPHA * ALPHA)) {
            X[index] = 0; // Set to zero directly
        }
    }
}