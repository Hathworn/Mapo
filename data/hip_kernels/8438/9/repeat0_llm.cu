#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;
#ifndef MAP_FILE
#define MAP_FILE MAP_SHARED
#endif

__global__ void repeat0(float* in, float* out, int outStride0, int outStride1, int outScalarCount) {
    // Improve performance by using the total thread count once
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    
    while (tid < outScalarCount) {
        int linearIndex = tid;
        int outIndex0 = linearIndex / outStride0;
        linearIndex = linearIndex - outIndex0 * outStride0;
        int outIndex1 = linearIndex / outStride1;
        int outIndex2 = linearIndex - outIndex1 * outStride1;
        // Calculate the input index efficiently
        int inIndex = outIndex2 + (outIndex0 + outIndex1) * outStride1;
        out[tid] = in[inIndex];
        // Increment this specific thread's index directly
        tid += stride;
    }
}