#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cumo_na_diagonal_stride_index_kernel(size_t *idx, ssize_t s0, size_t *idx1, size_t k0, size_t k1, uint64_t n)
{
    // Calculate unique thread index within the grid
    uint64_t threadId = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure only active threads perform calculations
    if (threadId < n) {
        idx[threadId] = s0 * (threadId + k0) + idx1[threadId + k1];
    }
}