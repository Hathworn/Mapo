```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void PadMatrixInLeadingDimensionKernel(const int8_t* src, int8_t* dst, int col_src, int col_dst) {
    int idx = blockIdx.x * col_src + threadIdx.x;
    int dst_idx = blockIdx.x * col_dst + threadIdx.x;
    // Loop unrolling for better memory coalescing
    for (int i = idx; i < col_src; i += blockDim.x * gridDim.x) {
        dst[dst_idx] = src[i];
    }
}