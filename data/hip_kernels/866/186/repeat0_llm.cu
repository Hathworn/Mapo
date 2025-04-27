#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void repeat0(float* in, float* out, int outStride0, int outStride1, int outScalarCount) {
    // Calculate global thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    while (tid < outScalarCount) {
        // Simplify linear index calculation using div and mod operations for better readability and performance
        int outIndex0 = tid / outStride0;
        tid = tid % outStride0;
        int outIndex1 = tid / outStride1;
        int outIndex2 = tid % outStride1;

        // Calculate input index with reduced arithmetic operations
        int inIndex = outIndex2 + outIndex1 * outStride1 + outIndex0 * outStride1;

        // Write output
        out[tid] = in[inIndex];

        // Advance to the next index
        tid += stride;
    }
}