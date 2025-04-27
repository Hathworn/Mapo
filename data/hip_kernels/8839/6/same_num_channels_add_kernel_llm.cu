#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void same_num_channels_add_kernel(float *data_l, float *data_r, float *result)
{
    // Calculate unique thread index in flattened grid
    int idx = blockIdx.x * blockDim.x + threadIdx.x; 
    int stride = blockDim.x * gridDim.x; // Calculate the total stride
    int index = 2 * idx; // Each index handles two elements

    // Unroll loop to optimize memory access and computation
    for (; index < gridDim.x * gridDim.y * blockDim.x * blockDim.y * 2; index += 2 * stride) {
        result[index] = data_l[index] + data_r[index];
        result[index + 1] = data_l[index + 1] + data_r[index + 1];
    }
}