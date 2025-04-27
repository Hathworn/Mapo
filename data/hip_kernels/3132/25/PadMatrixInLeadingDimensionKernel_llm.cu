#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void PadMatrixInLeadingDimensionKernel(const int8_t* src, int8_t* dst, int col_src, int col_dst) {
    int tid = threadIdx.x;
    int block_offset_src = blockIdx.x * col_src;
    int block_offset_dst = blockIdx.x * col_dst;
    
    // Loop unrolling for efficiency, assuming col_src is a multiple of 4
    #pragma unroll
    for (int32_t i = tid; i < col_src; i += blockDim.x) {
        dst[block_offset_dst + i] = src[block_offset_src + i];
    }
}