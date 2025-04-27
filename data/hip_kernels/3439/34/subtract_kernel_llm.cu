#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subtract_kernel(float *in1, float *in2, float *out)
{
    // Calculate global thread ID
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int j = blockIdx.y * blockDim.y + threadIdx.y;
    unsigned int k = blockIdx.z * blockDim.z + threadIdx.z;

    // Precompute bounds for efficiency
    unsigned int max_x = c_Size.x;
    unsigned int max_y = c_Size.y;
    unsigned int max_z = c_Size.z;

    // Skip computations if the thread ID exceeds bounds
    if (i >= max_x || j >= max_y || k >= max_z)
        return;

    // Use faster integer arithmetic for indexing
    long int id = ((long int)k * max_y + j) * max_x + i;

    // Perform subtraction
    out[id] = in1[id] - in2[id];
}