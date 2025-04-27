#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void supp_kernel(int N, float ALPHA, float *X, int INCX)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure the entire grid covers N elements and avoid unnecessary calculation
    int gridStride = blockDim.x * gridDim.x;
    
    for(; i < N; i += gridStride) {
        if((X[i*INCX] * X[i*INCX]) < (ALPHA * ALPHA)) {
            X[i*INCX] = 0;
        }
    }
}