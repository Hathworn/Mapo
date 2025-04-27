#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cumo_na_index_aref_naview_index_stride_kernel(size_t *idx, ssize_t s1, uint64_t n)
{
    // Calculate the global thread index
    uint64_t i = blockIdx.x * blockDim.x + threadIdx.x;

    // Loop with stride to process all elements
    for (; i < n; i += blockDim.x * gridDim.x) {
        idx[i] *= s1; // Perform the multiplication
    }
}