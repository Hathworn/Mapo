#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mult_add_into_kernel(int n, float *a, float *b, float *c)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use grid stride loop to process all elements
    for (int index = i; index < n; index += blockDim.x * gridDim.x) {
        c[index] += a[index] * b[index];
    }
}