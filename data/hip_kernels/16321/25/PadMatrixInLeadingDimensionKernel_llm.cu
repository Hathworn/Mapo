#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void PadMatrixInLeadingDimensionKernel(const int8_t* __restrict__ src, int8_t* __restrict__ dst, int col_src, int col_dst) {
    // Calculate the global index for the thread
    int idx = blockIdx.x * col_src + threadIdx.x;
    int stride = blockDim.x * gridDim.x;  // Total threads within the grid

    for (int i = idx; i < col_src * gridDim.x; i += stride) {
        // Copy element from source to destination with leading dimension padding
        dst[blockIdx.x * col_dst + (i % col_src)] = src[i];
    }
}