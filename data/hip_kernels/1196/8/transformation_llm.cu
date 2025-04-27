#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transformation(size_t num_values, float_t* src, float_t* dest, size_t ld_src, size_t ld_dest)
{
    size_t index = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory for coalesced access
    __shared__ float_t shared_src[256];  // Adjust size as necessary (change 256 if needed)

    if (index < num_values)
    {
        // Load data into shared memory
        shared_src[threadIdx.x] = src[index];
        __syncthreads();

        // Calculate destination index
        size_t dest_index = (index / ld_src) * ld_src + ((index % ld_src) % 8) * ld_dest + (index % ld_src) / 8;

        // Store data from shared memory to global memory
        dest[dest_index] = shared_src[threadIdx.x];
    }
}