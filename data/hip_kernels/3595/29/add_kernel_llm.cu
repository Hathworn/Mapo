#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate the unique thread index within the grid
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use stride to efficiently process elements beyond the first block
    for (; i < N; i += blockDim.x * gridDim.x)
    {
        // Perform the addition operation on the indexed element
        X[i*INCX] += ALPHA;
    }
}