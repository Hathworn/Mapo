#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void PadMatrixInLeadingDimensionKernel(const int8_t* src, int8_t* dst, int col_src, int col_dst) {
    // Calculate the starting index for the thread in the matrix
    int32_t startIdx = threadIdx.x + blockIdx.x * blockDim.x;
    int32_t stride = blockDim.x * gridDim.x; // Total threads in the grid
    for (int32_t i = startIdx; i < col_src; i += stride) {
        *(dst + blockIdx.x * col_dst + i) = *(src + blockIdx.x * col_src + i);
    }
}
```
