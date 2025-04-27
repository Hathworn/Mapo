#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _bcnn_vdiv_kernel(int n, float *a, float *b, float *y)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index using only blockIdx.x and threadIdx.x

    // Use a stride loop to allow grid-stride
    for (; i < n; i += blockDim.x * gridDim.x) {
        y[i] = a[i] / b[i];
    }
}