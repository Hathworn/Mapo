#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK_DIM_X 16
#define BLOCK_DIM_Y 32

#define N 16

__global__ static void KerBitReversalMatrixRow(float *d_lpDstRe, float *d_lpDstIm, float *d_lpSrcRe, float *d_lpSrcIm, int width, int log2x)
{
    int x = blockDim.x * blockIdx.x + threadIdx.x;
    int y = blockDim.y * blockIdx.y + threadIdx.y;
    
    // Calculate index only for valid x
    if (x < (1 << log2x))
    {
        int index = __brev(x) >> (32 - log2x); // Use __brev to reverse bits of x
        if (x >= index)
        {
            // Compute memory addresses only once
            int idx = width * y + x;
            int jdx = width * y + index;

            // Use float type directly since data is float
            float tmpRe = d_lpDstRe[idx];
            float tmpIm = d_lpDstIm[idx];

            d_lpDstRe[idx] = d_lpSrcRe[jdx];
            d_lpDstIm[idx] = d_lpSrcIm[jdx];

            d_lpDstRe[jdx] = tmpRe;
            d_lpDstIm[jdx] = tmpIm;
        }
    }
}