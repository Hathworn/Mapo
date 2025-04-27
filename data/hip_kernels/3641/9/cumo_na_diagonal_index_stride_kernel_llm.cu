#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cumo_na_diagonal_index_stride_kernel(size_t *idx, size_t *idx0, ssize_t s1, size_t k0, size_t k1, uint64_t n)
{
    // Use a loop stride technique to improve memory access patterns
    uint64_t stride = blockDim.x * gridDim.x;
    uint64_t i = blockIdx.x * blockDim.x + threadIdx.x;
    while (i < n) {
        idx[i] = idx0[i + k0] + s1 * (i + k1);
        i += stride; // Increment by the total number of threads
    }
}