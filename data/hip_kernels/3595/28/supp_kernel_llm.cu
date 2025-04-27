#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void supp_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Iterate through the data chunck by stride jumping
    for (; i < N; i += blockDim.x * gridDim.x) {
        // Pre-compute common expression
        int index = i * INCX;
        float value = X[index] * X[index];
        
        // Conditional update to zero
        if(value < (ALPHA * ALPHA)) {
            X[index] = 0;
        }
    }
}