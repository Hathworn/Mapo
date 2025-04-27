#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void saxpy(int * a, int * b, int * c)
{
    // Calculate the global thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Use grid-stride loop to allow for more flexible grid size
    int stride = blockDim.x * gridDim.x;

    // Optimize with loop unrolling for better performance
    for(int i = tid; i < N; i += stride * 4) {
        c[i] = 2 * a[i] + b[i];
        if (i + stride < N) c[i + stride] = 2 * a[i + stride] + b[i + stride];
        if (i + 2 * stride < N) c[i + 2 * stride] = 2 * a[i + 2 * stride] + b[i + 2 * stride];
        if (i + 3 * stride < N) c[i + 3 * stride] = 2 * a[i + 3 * stride] + b[i + 3 * stride];
    }
}