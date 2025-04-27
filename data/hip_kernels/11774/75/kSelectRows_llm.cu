#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSelectRows(float* __restrict__ source, float* __restrict__ target, float* __restrict__ indices, int nRowIs, int nCols, int nSourceRows) {
    __shared__ int sourceRowIndices[32];
    const int startTargetRowI = blockIdx.x * 32;
    const int tid = threadIdx.x;
    const int localNRowIs = min(32, nRowIs - startTargetRowI);
    
    // Load row indices into shared memory
    if (tid < localNRowIs) {
        int index = int(indices[startTargetRowI + tid]);
        if (index < 0) index += nSourceRows;
        sourceRowIndices[tid] = (index < 0 || index >= nSourceRows) ? -1 : index;
    }
    __syncthreads();
    
    // Copy rows, optimized to avoid unnecessary calculations
    if (tid < nCols) {
        for (int i = 0; i < localNRowIs; i++) {
            const int targetRowI = startTargetRowI + i;
            const int sourceRowI = sourceRowIndices[i];
            if (sourceRowI != -1) {
                target[targetRowI * nCols + tid] = source[sourceRowI * nCols + tid];
            } else {
                target[targetRowI * nCols + tid] = NAN; // Use NaN for invalid source row
            }
        }
    }
}