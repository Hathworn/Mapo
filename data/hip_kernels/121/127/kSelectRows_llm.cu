#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSelectRows(float* source, float* target, float* indices, int nRowIs, int nCols, int nSourceRows){
    __shared__ int sourceRowIndices[32];
    const int startTargetRowI = blockIdx.x * 32;
    const int tid = threadIdx.x;
    const int localNRowIs = min(32, nRowIs - startTargetRowI);

    // Load row indices
    if (tid < localNRowIs){
        int idx = int(indices[startTargetRowI + tid]);
        if (idx < 0) idx += nSourceRows;
        sourceRowIndices[tid] = (idx < 0 || idx >= nSourceRows) ? -1 : idx;
    }
    __syncthreads();

    // Copy rows
    for (int i = 0; i < localNRowIs; i++){
        const int targetRowI = startTargetRowI + i;
        const int sourceRowI = sourceRowIndices[i];
        if (sourceRowI != -1) {
            // Copy valid rows
            for (int colI = tid; colI < nCols; colI += 32) {
                target[targetRowI * nCols + colI] = source[sourceRowI * nCols + colI];
            }
        } else {
            // Handle invalid rows (optimized)
            for (int colI = tid; colI < nCols; colI += 32) {
                target[targetRowI * nCols + colI] = -1.0 / 0.0;  // Use NaN
            }
        }
    }
}