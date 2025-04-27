#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fill_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Using a single thread block ID calculation for cleaner code
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int grid_stride = gridDim.x * blockDim.x;

    // Using a stride loop for potentially better utilization of resources
    for (; i < N; i += grid_stride) {
        X[i * INCX] = ALPHA;
    }
}