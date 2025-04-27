#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void constant_add_kernel(float *data_l, float constant, float *result)
{
    // Optimize: Use linear thread index to improve memory access pattern
    int threadIdxGlobal = blockIdx.x * blockDim.x + threadIdx.x;

    // Unroll loop to enhance performance
    int index1 = threadIdxGlobal * 2;
    int index2 = index1 + 1;

    result[index1] = data_l[index1] + constant;
    result[index2] = data_l[index2];
}