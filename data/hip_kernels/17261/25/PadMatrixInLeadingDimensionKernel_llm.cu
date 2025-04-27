#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void PadMatrixInLeadingDimensionKernel(const int8_t* src, int8_t* dst, int col_src, int col_dst) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < col_src) {  // Avoid redundant condition checks inside loop
        *(dst + blockIdx.x * col_dst + idx) = *(src + blockIdx.x * col_src + idx);
    }
}