#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void supp_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate unique thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Iterate through data with stride
    for(int idx = i; idx < N; idx += blockDim.x * gridDim.x) {
        if((X[idx * INCX] * X[idx * INCX]) < (ALPHA * ALPHA)) {
            X[idx * INCX] = 0; // Zero out elements less than ALPHA squared
        }
    }
}