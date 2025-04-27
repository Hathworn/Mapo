#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel with coalesced memory access
__global__ void PadMatrixInLeadingDimensionKernel(const int8_t* __restrict__ src, int8_t* __restrict__ dst, int col_src, int col_dst) {
    int global_idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    for (int i = global_idx; i < col_src; i += stride) {
        dst[blockIdx.x * col_dst + i] = src[blockIdx.x * col_src + i];
    }
}