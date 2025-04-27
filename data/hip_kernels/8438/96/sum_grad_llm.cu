#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sum_grad(float* in, int inSize0, int inSize1, int inSize2, int inSize3, int nElement, float* out, int outStride0, int outStride1, int outStride2, int dim) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Calculate index offsets outside loop for performance improvement
    int inOff2, inDim3, inOff1, inDim2, inDim0, inDim1, outOff;

    for (int i = tid; i < nElement; i += stride) {
        inOff2 = i / inSize3;
        inDim3 = i - inOff2 * inSize3;
        inOff1 = inOff2 / inSize2;
        inDim2 = inOff2 - inOff1 * inSize2;
        inDim0 = inOff1 / inSize1;
        inDim1 = inOff1 - inDim0 * inSize1;

        // Use switch-case for clarity and potential performance optimization
        switch(dim) {
            case 0:
                outOff = inDim1 * outStride0 + inDim2 * outStride1 + inDim3 * outStride2;
                break;
            case 1:
                outOff = inDim0 * outStride0 + inDim2 * outStride1 + inDim3 * outStride2;
                break;
            case 2:
                outOff = inDim0 * outStride0 + inDim1 * outStride1 + inDim3 * outStride2;
                break;
            case 3:
                outOff = inDim0 * outStride0 + inDim1 * outStride1 + inDim2 * outStride2;
                break;
        }

        in[i] += out[outOff];
    }
}