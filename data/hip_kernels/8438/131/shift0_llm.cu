#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void shift0(float* in, float* out, int inDim0, int inStride0, int inStride1, int inScalarCount) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    for (; tid < inScalarCount; tid += stride) {
        int inIndex0 = tid / inStride0;
        int inIndex1 = (tid % inStride0) / inStride1; // Use modulus for better readability and efficiency
        if (inIndex0 + inIndex1 >= inDim0) break; // Use break instead of return for better flow control
        out[tid + inIndex1 * inStride0] = in[tid];
    }
}