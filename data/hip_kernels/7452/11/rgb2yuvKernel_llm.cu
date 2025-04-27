#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void rgb2yuvKernel(int *imgr, int *imgg, int *imgb, int *imgy, int *imgcb, int *imgcr, int n) {

    int index = threadIdx.x + blockIdx.x * blockDim.x;

    // Check if the thread index is within the array bounds
    if (index < n) {
        int r = imgr[index];
        int g = imgg[index];
        int b = imgb[index];

        // Compute Y, Cb, Cr using integer arithmetic for efficiency
        int y  = __float2int_rn(0.299f * r + 0.587f * g + 0.114f * b);
        int cb = __float2int_rn(-0.147f * r - 0.289f * g + 0.436f * b);
        int cr = __float2int_rn(0.615f * r - 0.515f * g - 0.1f * b);

        imgy[index] = y;
        imgcb[index] = cb;
        imgcr[index] = cr;
    }
}