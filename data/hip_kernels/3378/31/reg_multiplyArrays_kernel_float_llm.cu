#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reg_multiplyArrays_kernel_float(float *array1_d, float *array2_d)
{
    // Calculate the global thread ID
    const int tid = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;

    // Optimize boundary check
    if(tid < c_VoxelNumber) {
        array1_d[tid] *= array2_d[tid];
    }
}