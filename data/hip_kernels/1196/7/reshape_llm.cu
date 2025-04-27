#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reshape(size_t num_values, float_t* src, float_t* dest, size_t ld_src, size_t ld_dest)
{
    // Using shared memory to reduce global memory access and increase cache hits
    __shared__ float_t sharedSrc[256]; // Adjust size according to your needs and hardware
    size_t index = blockIdx.x * blockDim.x + threadIdx.x;
    size_t localIndex = threadIdx.x;
    if (index < num_values)
    {
        size_t src_index = (index / ld_dest) * ld_src + index % ld_dest;
        sharedSrc[localIndex] = src[src_index]; // Load data to shared memory
        __syncthreads();  // Ensure all threads have written to shared memory before reading

        dest[index] = sharedSrc[localIndex]; // Copy from shared memory to global memory
    }
}