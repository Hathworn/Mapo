#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSelectRows(float* source, float* target, float* indices, int nRowIs, int nCols, int nSourceRows) {
    __shared__ int sourceRowIndices[32];
    const int startTargetRowI = blockIdx.x * 32;
    const int tid = threadIdx.x;
    const int localNRowIs = min(32, nRowIs - startTargetRowI);

    // Load row indices cooperatively and perform conditional checks
    if (tid < localNRowIs) {
        int srcIdx = int(indices[startTargetRowI + tid]);
        // Ensuring the index is within bounds
        srcIdx = (srcIdx < 0) ? (srcIdx + nSourceRows) : srcIdx;
        sourceRowIndices[tid] = (srcIdx < 0 || srcIdx >= nSourceRows) ? -1 : srcIdx;
    }
    __syncthreads();

    // Efficiently copy rows with multiple threads per row
    for (int i = 0; i < localNRowIs; i++) {
        const int targetRowI = startTargetRowI + i;
        const int sourceRowI = sourceRowIndices[i];
        if (sourceRowI != -1) {  // Skip if invalid index
            for (int colI = tid; colI < nCols; colI += 32) {
                target[targetRowI * nCols + colI] = source[sourceRowI * nCols + colI];
            }
        }
    }
}