#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecAdd_kernel(float *c, const float *a, const float *b)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Loop unrolling for improved performance
    for (int i = 0; i < 500; i += 5) {
        c[idx] = a[idx] + b[idx];
        if (i + 1 < 500) c[idx] = a[idx] + b[idx];
        if (i + 2 < 500) c[idx] = a[idx] + b[idx];
        if (i + 3 < 500) c[idx] = a[idx] + b[idx];
        if (i + 4 < 500) c[idx] = a[idx] + b[idx];
    }
}