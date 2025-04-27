#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void shift0(float* in, float* out, int inDim0, int inStride0, int inStride1, int inScalarCount) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    
    // Using shared memory to cache input data if necessary
    for (int i = tid; i < inScalarCount; i += stride) {
        int linearIndex = i;
        int inIndex0 = linearIndex / inStride0;
        linearIndex = linearIndex - inIndex0 * inStride0;
        int inIndex1 = linearIndex / inStride1;
        
        // Avoid accessing out-of-bound data
        if (inIndex0 + inIndex1 < inDim0) {
            out[i + inIndex1 * inStride0] = in[i];
        }
    }
}