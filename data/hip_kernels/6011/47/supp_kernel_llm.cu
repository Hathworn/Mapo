#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void supp_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure we only process valid elements
    if (i >= N) return;
    
    // Compute the index considering the stride INCX
    int idx = i * INCX;
    
    // Calculate the squared value once for comparison
    float x_squared = X[idx] * X[idx];
    
    // Set to zero if the squared value is less than ALPHA squared
    if (x_squared < (ALPHA * ALPHA)) {
        X[idx] = 0;
    }
}