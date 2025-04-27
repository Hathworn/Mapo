#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void supp_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Optimize index calculation by removing gridDim.y
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x; // Use stride for iteration

    // Loop over elements with stride to cover the entire array
    for (int idx = i; idx < N; idx += stride) {
        float val = X[idx * INCX];
        if ((val * val) < (ALPHA * ALPHA)) {
            X[idx * INCX] = 0;
        }
    }
}