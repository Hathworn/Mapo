#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void PadMatrixInLeadingDimensionKernel(const int8_t* src, int8_t* dst, int col_src, int col_dst) {
    // Load block index and shared memory padding computation
    int row_offset_src = blockIdx.x * col_src;
    int row_offset_dst = blockIdx.x * col_dst;
    
    for (int32_t i = threadIdx.x; i < col_src; i += blockDim.x) {
        // Improved memory access with precomputed offsets
        dst[row_offset_dst + i] = src[row_offset_src + i];
    }
}