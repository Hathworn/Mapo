#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSelectRows(float* source, float* target, float* indices, int nRowIs, int nCols, int nSourceRows) {
    __shared__ int sourceRowIndices[32];
    const int startTargetRowI = blockIdx.x * blockDim.x; // Adjusted for dynamic block size
    const int tid = threadIdx.x;
    const int localNRowIs = min(blockDim.x, nRowIs - startTargetRowI);

    // Load row indices collaboratively
    if (tid < localNRowIs) {
        int idx = int(indices[startTargetRowI + tid]);
        if (idx < 0) idx += nSourceRows; // Adjust negative indices
        sourceRowIndices[tid] = (idx < 0 || idx >= nSourceRows) ? -1 : idx; // Mark invalid indices
    }
    __syncthreads(); 

    // Copy rows with optimized shared memory access
    for (int i = 0; i < localNRowIs; i++) {
        const int targetRowI = startTargetRowI + i;
        const int sourceRowI = sourceRowIndices[i];
        for (int colI = tid; colI < nCols; colI += blockDim.x) {
            target[targetRowI * nCols + colI] = (sourceRowI == -1) ? (1.0 / 0.0 - 1.0 / 0.0) : source[sourceRowI * nCols + colI];
        }
    }
}