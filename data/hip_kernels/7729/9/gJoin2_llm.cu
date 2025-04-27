#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gJoin2(float* out, size_t rowBatch, size_t cols, const float* in1, size_t inStride1, const float* in2, size_t inStride2) {
    const int outStride = inStride1 + inStride2;
    const int rows = rowBatch * outStride;

    // Optimize block-level iteration
    int j = blockIdx.x + blockIdx.y * gridDim.x;
    if (j < rows) {
        float* rowOut = out + j * cols;

        int curBatch = j / outStride;
        int curPos = j % outStride;

        int jIn1 = (curBatch * inStride1) + curPos;
        int jIn2 = (curBatch * inStride2) + curPos - inStride1;

        const float* rowIn1 = in1 + jIn1 * cols;
        const float* rowIn2 = in2 + jIn2 * cols;

        // Optimize thread-level iteration
        int i = threadIdx.x;
        if (i < cols) {
            if (curPos < inStride1)
                rowOut[i] = rowIn1[i];
            else
                rowOut[i] = rowIn2[i];
        }
    }
}