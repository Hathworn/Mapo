#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void shift0(float* in, float* out, int inDim0, int inStride0, int inStride1, int inScalarCount) {
    // Calculate thread id outside the loop
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    while (tid < inScalarCount) {
        int linearIndex = tid;
        int inIndex0 = linearIndex / inStride0;
        linearIndex -= inIndex0 * inStride0;
        int inIndex1 = linearIndex / inStride1;

        // Avoid redundant calculation of return condition
        if (inIndex0 + inIndex1 < inDim0) {
            out[tid + inIndex1 * inStride0] = in[tid];
        }
        tid += stride; // Increment tid outside loop header
    }
}