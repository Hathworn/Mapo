#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void constrain_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate unique thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x; 

    // Use stride loop for better utilization of GPU resources
    while(i < N) {
        X[i*INCX] = fminf(ALPHA, fmaxf(-ALPHA, X[i*INCX]));
        i += blockDim.x * gridDim.x; // Move to the next index this thread should handle
    }
}