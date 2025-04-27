#include "hip/hip_runtime.h"
#include "includes.h"

/* Perfom a reduction from data of length 'size' to result, where length of result will be 'number of blocks'. */
extern "C"
__global__ void multScalar(int n, float *a, float b, float *result)
{
    // Use grid-stride loop for better memory access and load balancing
    for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < n; i += blockDim.x * gridDim.x) {
        result[i] = a[i] * b;
    }
}