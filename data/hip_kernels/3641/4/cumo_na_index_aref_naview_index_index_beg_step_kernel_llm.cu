#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cumo_na_index_aref_naview_index_index_beg_step_kernel(size_t *idx, size_t *idx1, size_t beg, ssize_t step, uint64_t n)
{
    // Compute this thread's unique global index
    uint64_t i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use stride loop pattern for better memory access pattern and load balancing
    uint64_t stride = blockDim.x * gridDim.x;
    while (i < n) {
        idx[i] = idx1[beg + step * i];
        i += stride;
    }
}