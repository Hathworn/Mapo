#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void shift0(float* in, float* out, int inDim0, int inStride0, int inStride1, int inScalarCount) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Use loop unrolling for better performance
    for (; tid < inScalarCount; tid += stride) {
        int linearIndex = tid;
        int inIndex0 = linearIndex / inStride0;
        linearIndex -= inIndex0 * inStride0;
        int inIndex1 = linearIndex / inStride1;

        // Improve branch prediction by rearranging condition logic
        if (inIndex0 + inIndex1 < inDim0) {
            out[tid + inIndex1 * inStride0] = in[tid];
        }
    }
}