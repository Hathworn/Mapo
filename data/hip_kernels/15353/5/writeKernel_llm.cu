#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void writeKernel(float* vec, int len)
{
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int j = blockIdx.y * blockDim.y + threadIdx.y;
    unsigned int k = blockIdx.z * blockDim.z + threadIdx.z;

    // Early exit for out-of-bound threads for efficiency
    if (i >= c_size.x || j >= c_size.y || k >= c_size.z)
        return;

    // Pre-calculate indices to reduce redundant computation
    long int base_id = len * (i + c_size.x * (j + k * c_size.y));
    
    // Use temporary variable for loop index to prevent redundant recalculation
    for (long int w = 0; w < len; ++w)
    {
        long int id = w + base_id;
        vec[id] = id;
    }
}