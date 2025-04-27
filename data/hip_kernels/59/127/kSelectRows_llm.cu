#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSelectRows(float* source, float* target, float* indices, int nRowIs, int nCols, int nSourceRows) {
    __shared__ int sourceRowIndices[32];
    const int startTargetRowI = blockIdx.x * 32;
    const int tid = threadIdx.x;
    const int localNRowIs = min(32, nRowIs - startTargetRowI);

    // Load row indices into shared memory by all threads
    if (tid < localNRowIs) {
        sourceRowIndices[tid] = int(indices[startTargetRowI + tid]);
        if (sourceRowIndices[tid] < 0)
            sourceRowIndices[tid] += nSourceRows;
        if (sourceRowIndices[tid] < 0 || sourceRowIndices[tid] >= nSourceRows)
            sourceRowIndices[tid] = -1;
    }
    __syncthreads();

    // Use a single loop to copy rows to improve performance
    for (int i = 0; i < localNRowIs; i++) {
        const int targetRowI = startTargetRowI + i;
        const int sourceRowI = sourceRowIndices[i];
        if (sourceRowI != -1) {  // Avoid copying if sourceRowI is invalid
            for (int colI = tid; colI < nCols; colI += 32) {
                target[targetRowI * nCols + colI] = source[sourceRowI * nCols + colI];
            }
        } else if (tid == 0) {  // Only the first thread sets invalid row to NaN
            for (int colI = 0; colI < nCols; colI++) {
                target[targetRowI * nCols + colI] = 1.0/0.0 - 1.0/0.0;
            }
        }
    }
}