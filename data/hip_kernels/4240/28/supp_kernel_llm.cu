#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void supp_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Process if within bounds
    if(i < N) {
        float val = X[i * INCX];
        // Use ALPHA squared to avoid repetitive computation
        if((val * val) < (ALPHA * ALPHA)) X[i * INCX] = 0;
    }
}