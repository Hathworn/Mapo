#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reg_multiplyArrays_kernel_float4(float4 *array1_d, float4 *array2_d)
{
    const int tid = (blockIdx.y * gridDim.x + blockIdx.x) * blockDim.x + threadIdx.x;

    // Use built-in warp size for coalesced memory access 
    if (tid < c_VoxelNumber)
    {
        float4 a = array1_d[tid];
        float4 b = array2_d[tid];  // Correct array2_d in the multiplication
        array1_d[tid] = make_float4(a.x * b.x, a.y * b.y, a.z * b.z, a.w * b.w);
    }
}