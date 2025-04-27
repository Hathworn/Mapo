#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void constrain_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure coalesced access by using INCX
    int index = i * INCX; 

    // Perform operation if within bounds
    if(index < N) {
        float x_val = X[index];
        
        // Apply constraints using ALPHA
        X[index] = fminf(ALPHA, fmaxf(-ALPHA, x_val));
    }
}