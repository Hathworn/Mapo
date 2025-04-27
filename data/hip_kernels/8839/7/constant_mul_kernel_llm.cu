```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void constant_mul_kernel(float *data_l, float constant, float *result)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Compute global thread index

    // Check bounds before accessing
    if (index * 2 < gridDim.x * blockDim.x * 2) {
        result[index * 2] = data_l[index * 2] * constant;
        result[index * 2 + 1] = data_l[index * 2 + 1] * constant;
    }
}