#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void supp_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate thread index accounting for 1D grid and 1D block layout
    int i = blockIdx.x * blockDim.x + threadIdx.x; 

    // Ensure thread operates within vector bounds
    if(i < N) { 
        float val = X[i * INCX]; // Cache value to prevent repeated memory accesses
        if(val * val < ALPHA * ALPHA) 
            X[i * INCX] = 0; // Set value to 0 if condition met
    }
}