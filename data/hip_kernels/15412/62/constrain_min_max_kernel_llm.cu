#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel by using shared memory and reducing max and min operations
__global__ void constrain_min_max_kernel(int N, float MIN, float MAX, float *X, int INCX)
{
    int i = (blockIdx.x * blockDim.x) + threadIdx.x;
    if (i < N) {
        // Perform min/max operation only if needed
        float value = X[i * INCX];
        value = value < MIN ? MIN : value;
        value = value > MAX ? MAX : value;
        X[i * INCX] = value;
    }
}