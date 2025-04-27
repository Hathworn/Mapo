#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kSetSelectedRows(float* target, float* source, float* indices, int nRowIs, int nCols, int nTargetRows){
    __shared__ int targetRowIndices[32];
    const int startSourceRowI = blockIdx.x * 32;
    const int tid = threadIdx.x;
    const int localNRowIs = min(32, nRowIs-startSourceRowI);

    // Load row indices in parallel
    if (tid < localNRowIs) {
        int index = int(indices[startSourceRowI + tid]);
        if (index < 0) index += nTargetRows; 
        targetRowIndices[tid] = (index < 0 || index >= nTargetRows) ? -1 : index;
    }
    __syncthreads();

    // Optimized row copy using thread block parallelism
    for (int i = 0; i < localNRowIs; i++) {
        const int targetRowI = targetRowIndices[i];
        if (targetRowI != -1) {  // Skip invalid rows
            for (int colI = tid; colI < nCols; colI += 32) {
                target[targetRowI * nCols + colI] = source[(startSourceRowI + i) * nCols + colI];
            }
        } else if (tid < nCols) {  // Set invalid target indices to NaN for the first warp
            target[tid + i * nCols] = (1.0 / 0.0 - 1.0 / 0.0);
        }
    }
}