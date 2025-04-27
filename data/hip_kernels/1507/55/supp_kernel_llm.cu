#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void supp_kernel(int N, float ALPHA, float *X, int INCX)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Flatten block index computation
    int stride = gridDim.x * blockDim.x; // Calculate stride for looping
    while (i < N) { // Use loop to cover larger dataset
        float value = X[i*INCX]; // Cache value to avoid repeated memory access
        if (value * value < ALPHA * ALPHA) X[i*INCX] = 0;
        i += stride; // Increment index by stride
    }
}