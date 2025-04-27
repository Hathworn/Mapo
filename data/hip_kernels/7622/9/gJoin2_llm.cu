#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gJoin2(float* out, size_t rowBatch, size_t cols, const float* in1, size_t inStride1, const float* in2, size_t inStride2) {
    int outStride = inStride1 + inStride2;
    int rows = rowBatch * outStride;
    int j = blockIdx.x + blockIdx.y * gridDim.x; // Utilize 2D grid

    if (j < rows) {
        float* rowOut = out + j * cols;
        int curBatch = j / outStride;
        int curPos = j % outStride;

        int jIn1 = (curBatch * inStride1) + curPos;
        int jIn2 = (curBatch * inStride2) + curPos - inStride1;

        const float* rowIn1 = in1 + jIn1 * cols;
        const float* rowIn2 = in2 + jIn2 * cols;

        // Use thread-level parallelism to load rows more efficiently
        int i = threadIdx.x;
        if (i < cols) {
            rowOut[i] = (curPos < inStride1) ? rowIn1[i] : rowIn2[i];
        }
    }
}