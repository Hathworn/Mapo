#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kSelectRows(float* source, float* target, float* indices, int nRowIs, int nCols, int nSourceRows){
    __shared__ int sourceRowIndices[32];
    const int startTargetRowI = blockIdx.x * 32;
    const int tid = threadIdx.x;
    const int localNRowIs = min(32, nRowIs-startTargetRowI);

    // Load row indices into shared memory
    if (tid < localNRowIs) {
        int index = int(indices[startTargetRowI + tid]);
        index = index < 0 ? index + nSourceRows : index;
        sourceRowIndices[tid] = (index < 0 || index >= nSourceRows) ? -1 : index;
    }
    __syncthreads();

    // Efficiently copy rows using optimized memory accesses
    for (int i = 0; i < localNRowIs; i++) {
        int sourceRowI = sourceRowIndices[i];
        if (sourceRowI != -1) {
            for (int colI = tid; colI < nCols; colI += 32) {
                target[(startTargetRowI + i) * nCols + colI] = source[sourceRowI * nCols + colI];
            }
        } else if (tid == 0) {  // handle NaN for invalid indices once per row
            for (int colI = 0; colI < nCols; colI++) {
                target[(startTargetRowI + i) * nCols + colI] = NAN;
            }
        }
    }
}