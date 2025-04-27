#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void simple_add(float* a, float* b, int n)
{
    // Utilize a stride loop to let each thread process multiple elements
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    for (; i < n; i += stride) {
        a[i] += b[i];
    }
}