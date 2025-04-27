#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void repeat0(float* in, float* out, int outStride0, int outStride1, int outScalarCount) {
    // Calculate the global thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    int linearIndex, outIndex0, outIndex1, outIndex2, inIndex;
    
    // Use shared memory if beneficial (depending on data access patterns - check separately if there's a benefit)
    // __shared__ float tile[blockDim.x];

    for (; tid < outScalarCount; tid += stride) {
        linearIndex = tid;

        // Optimize division and modulo using intrinsic functions if available
        outIndex0 = __div_trunc(linearIndex, outStride0);
        linearIndex -= outIndex0 * outStride0;
        
        outIndex1 = __div_trunc(linearIndex, outStride1);
        outIndex2 = linearIndex - outIndex1 * outStride1;
        
        inIndex = outIndex2 + (outIndex0 + outIndex1) * outStride1;
        
        // Read input and write output; confirm whether coalescing and access patterns are efficient
        out[tid] = in[inIndex];
    }
}