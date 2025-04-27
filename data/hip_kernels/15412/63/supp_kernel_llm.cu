#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void supp_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use stride to handle larger datasets
    for (int index = i; index < N; index += blockDim.x * gridDim.x) {
        // Efficient comparison and zeroing out
        if ((X[index * INCX] * X[index * INCX]) < (ALPHA * ALPHA)) {
            X[index * INCX] = 0;
        }
    }
}