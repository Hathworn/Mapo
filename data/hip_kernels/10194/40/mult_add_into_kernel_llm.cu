#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mult_add_into_kernel(int n, float *a, float *b, float *c)
{
    // Calculate the global thread index.
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;

    // Only perform operations within bounds.
    if(i < n) {
        // Use temporary variable for intermediate result.
        float temp = a[i] * b[i];
        c[i] += temp;
    }
}