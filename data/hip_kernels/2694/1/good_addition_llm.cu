#include "hip/hip_runtime.h"
#include "includes.h"

/* Optimized Vector Addition Kernel */
__global__ void good_addition(int *a, int *b, int *c, int len)
{
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x; // Total number of threads

    // Iterate over vector with stride
    for (int index = tid; index < len; index += stride)
    {
        c[index] = a[index] + b[index];
    }
}