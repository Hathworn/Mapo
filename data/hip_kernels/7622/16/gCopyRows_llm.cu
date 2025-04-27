#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gCopyRows(float* out, const float* in, size_t cols, const size_t* sourceRowIdx, size_t rows) {
    // Use a single block per row and a single thread per column element for better utilization
    int j = blockIdx.x;
    if(j < rows) {
        size_t dstId = j;
        size_t srcId = sourceRowIdx[j];
        
        float* rowOut = out + dstId * cols;
        const float* rowIn = in + srcId * cols;
        
        int i = threadIdx.x;
        if(i < cols)
            rowOut[i] = rowIn[i];
    }
}