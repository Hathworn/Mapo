```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kSetSelectedRows(float* target, float* source, float* indices, int nRowIs, int nCols, int nTargetRows){
    __shared__ int targetRowIndices[32];
    const int startSourceRowI = blockIdx.x * 32;
    const int tid = threadIdx.x;
    const int localNRowIs = min(32, nRowIs-startSourceRowI);

    // Load row indices cooperatively with boundary checks
    if (tid < localNRowIs) {
        int index = int(indices[startSourceRowI + tid]);
        if (index < 0) index += nTargetRows;
        targetRowIndices[tid] = (index < 0 || index >= nTargetRows) ? -1 : index;
    }
    __syncthreads();

    // Copy rows efficiently using shared memory indices
    for (int i = 0; i < localNRowIs; i++) {
        int targetRowI = targetRowIndices[i];
        if (targetRowI != -1) {
            for (int colI = tid; colI < nCols; colI += 32) {
                target[targetRowI * nCols + colI] = source[(startSourceRowI + i) * nCols + colI];
            }
        }
    }
}