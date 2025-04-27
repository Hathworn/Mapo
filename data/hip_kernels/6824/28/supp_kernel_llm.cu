#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void supp_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global thread ID more efficiently using grid-stride loop
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    
    for (; i < N; i += stride) {
        float value = X[i * INCX];  // Access the array with offset
        if ((value * value) < (ALPHA * ALPHA)) {
            X[i * INCX] = 0;  // Set to 0 if condition is met
        }
    }
}