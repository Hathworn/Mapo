#include "hip/hip_runtime.h"
#include "includes.h"

extern "C" {
}

__global__ void supp_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate unique global index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // stride loop to process entire array
    for(int i = idx; i < N; i += blockDim.x * gridDim.x) {
        // Calculate index with stride
        int index = i * INCX;
        
        // Check condition and update element
        if((X[index] * X[index]) < (ALPHA * ALPHA)) {
            X[index] = 0;
        }
    }
}