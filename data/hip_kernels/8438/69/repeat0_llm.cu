#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void repeat0(float* in, float* out, int outStride0, int outStride1, int outScalarCount) {
    // Calculate global thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    
    // Use while loop to avoid recomputing tid
    while (tid < outScalarCount) {
        int linearIndex = tid;
        int outIndex0 = linearIndex / outStride0;
        linearIndex = linearIndex % outStride0; // Use modulo for efficiency
        int outIndex1 = linearIndex / outStride1;
        int outIndex2 = linearIndex % outStride1; // Use modulo for efficiency
        int inIndex = outIndex2 + (outIndex0 + outIndex1) * outStride1;
        out[tid] = in[inIndex];
        
        // Increment by stride
        tid += stride;
    }
}