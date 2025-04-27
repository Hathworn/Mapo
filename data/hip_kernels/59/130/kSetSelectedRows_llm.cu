#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetSelectedRows(float* target, float* source, float* indices, int nRowIs, int nCols, int nTargetRows) {
    __shared__ int targetRowIndices[32];
    const int startSourceRowI = blockIdx.x * 32;
    const int tid = threadIdx.x;
    const int localNRowIs = min(32, nRowIs - startSourceRowI);

    // Load 32 row indices into shared memory
    if (tid < localNRowIs) {
        int tempIndex = int(indices[startSourceRowI + tid]);
        targetRowIndices[tid] = (tempIndex < 0) ? (tempIndex + nTargetRows) : tempIndex;
        if (targetRowIndices[tid] < 0 || targetRowIndices[tid] >= nTargetRows)
            targetRowIndices[tid] = -1;
    }
    __syncthreads();

    // Copy 32 rows using unrolled loops and shared memory for indices
    for (int i = 0; i < localNRowIs; i++) {
        const int sourceRowI = startSourceRowI + i;
        const int targetRowI = targetRowIndices[i];
        if (targetRowI != -1) {
            for (int colI = tid; colI < nCols; colI += 32) {
                target[targetRowI * nCols + colI] = source[sourceRowI * nCols + colI];
            }
        } else {
            for (int colI = tid; colI < nCols; colI += 32) {
                target[targetRowI * nCols + colI] = __int_as_float(0x7fffffff); // Set to NaN
            }
        }
    }
}