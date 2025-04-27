#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void fill_kernel(int N, float ALPHA, float *X, int INCX)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Compute global thread ID
    int grid_stride = gridDim.x * blockDim.x;       // Calculate grid stride

    for (; i < N; i += grid_stride) {               // Iterate over all elements processed by this thread
        X[i * INCX] = ALPHA;                        // Set the value
    }
}