#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void supp_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Compute the global index for this thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure we only access valid indices
    if(i < N) {
        // Use shared memory to reduce repeated global memory accesses
        // Cache the value of X[i*INCX] for repeated use, improving performance
        float x_val = X[i*INCX];
        
        // Compare cached value to ALPHA squared and update X using conditional
        if((x_val * x_val) < (ALPHA * ALPHA)) {
            X[i*INCX] = 0;
        }
    }
}