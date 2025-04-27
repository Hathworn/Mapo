#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gCopyRows(float* out, const float* in, size_t cols, const size_t* sourceRowIdx, size_t rows) {
    // Calculate row index handled by the current block
    int j = blockIdx.x + blockIdx.y * gridDim.x;

    // Calculate column index handled by the current thread within the block
    int i = threadIdx.x + blockDim.x * threadIdx.y;

    if (j < rows) {
        size_t dstId = j;
        size_t srcId = sourceRowIdx[j];

        float* rowOut = out + dstId * cols;
        const float* rowIn = in + srcId * cols;

        if (i < cols) {
            rowOut[i] = rowIn[i];
        }
    }
}
```
