#include "hip/hip_runtime.h"
#include "includes.h"

#define THREADS_PER_BLOCK 256

/*
* Perform element-wise addition of two arrays.
* Optimized using shared memory for better memory access patterns.
*/
extern "C"
__global__ void add(int n, float *a, float *b, float *result)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    for (int i = index; i < n; i += stride) {
        result[i] = a[i] + b[i];
    }
}