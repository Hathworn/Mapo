#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetSelectedRows(float* target, float* source, float* indices, int nRowIs, int nCols, int nTargetRows) {
    __shared__ int targetRowIndices[32];
    const int startSourceRowI = blockIdx.x * 32;
    const int tid = threadIdx.x;
    const int localNRowIs = min(32, nRowIs - startSourceRowI);

    // Cooperatively load 32 row indices
    #pragma unroll
    for (int i = tid; i < localNRowIs; i += 32) {
        targetRowIndices[i] = int(indices[startSourceRowI + i]);
        if (targetRowIndices[i] < 0)
            targetRowIndices[i] += nTargetRows;
        if (targetRowIndices[i] < 0 || targetRowIndices[i] >= nTargetRows)
            targetRowIndices[i] = -1;
    }
    __syncthreads();

    // Copy 32 rows
    #pragma unroll
    for (int i = 0; i < localNRowIs; i++) {
        const int sourceRowI = startSourceRowI + i;
        const int targetRowI = targetRowIndices[i];
        if (targetRowI != -1) {  // Only proceed if the index is valid
            for (int colI = tid; colI < nCols; colI += 32) {
                target[targetRowI * nCols + colI] = source[sourceRowI * nCols + colI];
            }
        }
    }
}