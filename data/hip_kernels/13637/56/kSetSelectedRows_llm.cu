#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kSetSelectedRows(float* target, float* source, float* indices, int nRowIs, int nCols, int nTargetRows) {
    __shared__ int targetRowIndices[32];
    const int startSourceRowI = blockIdx.x * 32;
    const int tid = threadIdx.x;
    const int localNRowIs = min(32, nRowIs - startSourceRowI);

    // Cooperatively load 32 row indices
    if (tid < localNRowIs) {
        int index = int(indices[startSourceRowI + tid]);
        index = index < 0 ? index + nTargetRows : index; // Normalize negative indices
        targetRowIndices[tid] = (index < 0 || index >= nTargetRows) ? -1 : index; // Validate range
    }
    __syncthreads();

    // Copy 32 rows
    for (int i = 0; i < localNRowIs; i++) {
        const int sourceRowI = startSourceRowI + i;
        const int targetRowI = targetRowIndices[i];
        if (targetRowI != -1) { // Skip invalid target row indices
            for (int colI = tid; colI < nCols; colI += 32) {
                target[targetRowI * nCols + colI] = source[sourceRowI * nCols + colI];
            }
        }
    }
}