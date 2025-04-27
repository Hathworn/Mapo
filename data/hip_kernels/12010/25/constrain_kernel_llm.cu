#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void constrain_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global index
    int global_index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure index is within bounds
    if(global_index < N) {
        int idx = global_index * INCX;
        
        // Use fmaxf function for boundary constraints
        X[idx] = fmaxf(-ALPHA, fminf(ALPHA, X[idx]));
    }
}