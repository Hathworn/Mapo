#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function with coalesced memory access
__global__ void set_volume_to_constant(float * out, float value)
{
    // Calculate 1D thread index for global memory access
    unsigned int thread_index = blockIdx.x * blockDim.x * c_Size.y * c_Size.z +
                                blockIdx.y * blockDim.y * c_Size.z +
                                blockIdx.z * blockDim.z +
                                threadIdx.x * c_Size.y * c_Size.z +
                                threadIdx.y * c_Size.z +
                                threadIdx.z;

    // Ensure thread_index is within array bounds
    if (thread_index < c_Size.x * c_Size.y * c_Size.z) {
        out[thread_index] = value;
    }
}