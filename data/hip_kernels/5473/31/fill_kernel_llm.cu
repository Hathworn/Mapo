#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fill_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Improved boundary check to avoid unnecessary calculations
    if(i * INCX < N) {
        X[i * INCX] = ALPHA;
    }
}