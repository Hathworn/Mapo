#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reg_addArrays_kernel_float(float *array1_d, float *array2_d)
{
    // Calculate linear thread index across the entire grid for improved indexing
    const int tid = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * (gridDim.x * blockDim.x);

    // Reduce branching with simple index boundary check
    if(tid < c_VoxelNumber)
    {
        array1_d[tid] += array2_d[tid];
    }
}