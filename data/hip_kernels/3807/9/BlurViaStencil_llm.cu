#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void BlurViaStencil(float* d_out, float* d_in) {
    const float kernel[3][3] = {0.04, 0.12, 0.04,
                                0.12, 0.36, 0.12,
                                0.04, 0.12, 0.04};
    int rowID = blockIdx.x + 1;
    int colID = threadIdx.x + 1;
    int pos = rowID * (blockDim.x + 2) + colID;

    // Compute indices to avoid repeated calculations
    int posRowAbove = pos - blockDim.x - 2;
    int posCurrentRow = pos;
    int posRowBelow = pos + blockDim.x + 2;

    // Apply stencil kernel to input matrix
    d_out[pos] = d_in[posRowAbove - 1] * kernel[0][0]
               + d_in[posRowAbove] * kernel[0][1]
               + d_in[posRowAbove + 1] * kernel[0][2]
               + d_in[posCurrentRow - 1] * kernel[1][0]
               + d_in[posCurrentRow] * kernel[1][1]
               + d_in[posCurrentRow + 1] * kernel[1][2]
               + d_in[posRowBelow - 1] * kernel[2][0]
               + d_in[posRowBelow] * kernel[2][1]
               + d_in[posRowBelow + 1] * kernel[2][2];
}