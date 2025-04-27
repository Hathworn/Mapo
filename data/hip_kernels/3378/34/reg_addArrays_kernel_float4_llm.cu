#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reg_addArrays_kernel_float4(float4 *array1_d, float4 *array2_d)
{
    // Calculate the thread index
    const int tid = blockIdx.x * blockDim.x * gridDim.y + blockIdx.y * blockDim.x + threadIdx.x;
    
    // Ensure thread index is within bounds
    if (tid < c_VoxelNumber) {
        // Load arrays into registers to optimize memory access
        float4 a = array1_d[tid];
        float4 b = array2_d[tid];
        
        // Perform the addition directly into array1_d to minimize register usage
        array1_d[tid] = make_float4(a.x + b.x, a.y + b.y, a.z + b.z, a.w + b.w);
    }
}