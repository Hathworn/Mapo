#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void supp_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Use a more efficient index calculation for better performance
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Use improved memory access patterns for contiguous memory access
    int grid_stride = gridDim.x * blockDim.x;
    for (int i = tid; i < N; i += grid_stride) {
        float value = X[i * INCX];
        if ((value * value) < (ALPHA * ALPHA)) {
            X[i * INCX] = 0;
        }
    }
}