#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void constrain_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global index using block and grid dimensions
    int i = blockIdx.x * blockDim.x + threadIdx.x; 
    
    // Ensure thread accesses only valid indices
    for(int index = i; index < N; index += blockDim.x * gridDim.x) {
        // Apply constraints to X values at the computed index
        X[index*INCX] = fminf(ALPHA, fmaxf(-ALPHA, X[index*INCX])); 
    }
}