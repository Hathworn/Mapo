#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSwapRows(float* source, float* target, float* indices1, float* indices2, int nRowIs, int nCols, int nRows){
    __shared__ int sourceRowIndices[32], targetRowIndices[32];
    const int startRowI = blockIdx.x * 32;
    const int tid = threadIdx.x;
    const int localNRowIs = min(32, nRowIs - startRowI);

    // Load 32 row indices cooperatively
    if (tid < localNRowIs) {
        int srcIdx = int(indices1[startRowI + tid]);
        int tgtIdx = int(indices2[startRowI + tid]);

        if (srcIdx < 0) srcIdx += nRows;
        if (tgtIdx < 0) tgtIdx += nRows;

        sourceRowIndices[tid] = (srcIdx < 0 || srcIdx >= nRows) ? -1 : srcIdx;
        targetRowIndices[tid] = (tgtIdx < 0 || tgtIdx >= nRows) ? -1 : tgtIdx;
    }
    __syncthreads();

    // Copy rows and swap them
    for (int i = 0; i < localNRowIs; i++) {
        const int sourceRowI = sourceRowIndices[i], targetRowI = targetRowIndices[i];
        for (int colI = tid; colI < nCols; colI += 32) {
            const float temp1 = (sourceRowI == -1) ? 0.0f : source[sourceRowI * nCols + colI];
            const float temp2 = (targetRowI == -1) ? 0.0f : target[targetRowI * nCols + colI];
            
            if (sourceRowI != -1) source[sourceRowI * nCols + colI] = temp2;
            if (targetRowI != -1) target[targetRowI * nCols + colI] = temp1;
        }
    }
}