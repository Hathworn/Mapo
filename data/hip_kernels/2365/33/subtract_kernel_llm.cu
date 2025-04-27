#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subtract_kernel(float* __restrict__ in1, float* __restrict__ in2, float* __restrict__ out)
{
    // Calculate global thread ID
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int j = blockIdx.y * blockDim.y + threadIdx.y;
    unsigned int k = blockIdx.z * blockDim.z + threadIdx.z;
    
    // Ensure thread is within bounds
    if (i < c_Size.x && j < c_Size.y && k < c_Size.z) {
        long int id = (k * c_Size.y + j) * c_Size.x + i;
        out[id] = in1[id] - in2[id];
    }
}