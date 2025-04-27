#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void supp_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate unique global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
  
    // Process elements with a stride loop for better memory access pattern
    for(; i < N; i += stride) {
        if((X[i*INCX] * X[i*INCX]) < (ALPHA * ALPHA)) X[i*INCX] = 0;
    }
}