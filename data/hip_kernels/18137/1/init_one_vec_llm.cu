#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void init_one_vec(float* d_one_vec, size_t length)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Use loop to cover entire array with fewer threads
    for (; i < length; i += stride) {
        d_one_vec[i] = 1.f; // Set the vector element to 1
    }
}