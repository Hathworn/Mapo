#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sum_grad(float* in, int inSize0, int inSize1, int inSize2, int inSize3, int nElement, float* out, int outStride0, int outStride1, int outStride2, int dim) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Precompute shifts for efficiency
    int inSize2_inSize3 = inSize2 * inSize3;
    int inSize1_inSize2 = inSize1 * inSize2;
    
    for (int i = tid; i < nElement; i += stride) {
        // Simplified index calculations
        int inOff1 = i / inSize2_inSize3;
        int inDim1 = inOff1 % inSize1;
        int inDim0 = inOff1 / inSize1;
        int inOff2 = i % inSize2_inSize3;
        int inDim2 = inOff2 / inSize3;
        int inDim3 = inOff2 % inSize3;

        int outOff = 0;
        // Efficient index conditional processing
        if (dim == 0)      outOff = inDim1 * outStride0 + inDim2 * outStride1 + inDim3 * outStride2;
        else if (dim == 1) outOff = inDim0 * outStride0 + inDim2 * outStride1 + inDim3 * outStride2;
        else if (dim == 2) outOff = inDim0 * outStride0 + inDim1 * outStride1 + inDim3 * outStride2;
        else if (dim == 3) outOff = inDim0 * outStride0 + inDim1 * outStride1 + inDim2 * outStride2;

        in[i] += out[outOff];
    }
}