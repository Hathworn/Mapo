#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void supp_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate the global index of the thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure that the index falls within the valid range
    if(i < N) {
        float val = X[i * INCX]; // Load value once
        if(val * val < ALPHA * ALPHA) {
            X[i * INCX] = 0; // Set to zero if condition is met
        }
    }
}