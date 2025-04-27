#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cumo_na_index_aref_nadata_index_stride_kernel(size_t *idx, ssize_t s1, uint64_t n)
{
    // Calculate global index once and reuse variable
    uint64_t global_idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Loop without recalculating thread index per iteration
    for (uint64_t i = global_idx; i < n; i += blockDim.x * gridDim.x) {
        idx[i] *= s1;  // Direct multiplication assignment
    }
}