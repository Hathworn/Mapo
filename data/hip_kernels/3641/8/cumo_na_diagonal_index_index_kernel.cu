#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cumo_na_diagonal_index_index_kernel(size_t *idx, size_t *idx0, size_t *idx1, size_t k0, size_t k1, uint64_t n)
{
for (uint64_t i = blockIdx.x * blockDim.x + threadIdx.x; i < n; i += blockDim.x * gridDim.x) {
idx[i] = idx0[i+k0] + idx1[i+k1];
}
}