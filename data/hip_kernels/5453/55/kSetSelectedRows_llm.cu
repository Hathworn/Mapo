#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kSetSelectedRows(float* target, float* source, float* indices, int nRowIs, int nCols, int nTargetRows) {
    __shared__ int targetRowIndices[32];
    const int startSourceRowI = blockIdx.x * 32;
    const int tid = threadIdx.x;
    const int localNRowIs = min(32, nRowIs - startSourceRowI);

    // Load 32 row indices cooperatively
    if (tid < localNRowIs) {
        int idx = int(indices[startSourceRowI + tid]);
        if (idx < 0) idx += nTargetRows;
        targetRowIndices[tid] = (idx < 0 || idx >= nTargetRows) ? -1 : idx;
    }
    __syncthreads();

    // Copy 32 rows optimized by using a separate condition check
    for (int i = 0; i < localNRowIs; i++) {
        const int sourceRowI = startSourceRowI + i;
        const int targetRowI = targetRowIndices[i];
        if (targetRowI != -1) { // Execute only if valid targetRowI
            for (int colI = tid; colI < nCols; colI += 32) {
                target[targetRowI * nCols + colI] = source[sourceRowI * nCols + colI];
            }
        } else if (tid == 0) { // Handle NaN assignment only once per out-of-bounds row
            for (int colI = 0; colI < nCols; colI++) {
                target[targetRowI * nCols + colI] = 1.0 / 0.0 - 1.0 / 0.0;
            }
        }
    }
}