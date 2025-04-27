#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void rgb2grayKernel(unsigned char *imgr, unsigned char *imgg, unsigned char *imgb, unsigned char *img_gray, int n) {

    // Optimize memory access by using local variables
    int index = blockIdx.x * blockDim.x + threadIdx.x;    

    if (index < n){
        unsigned char r = imgr[index];
        unsigned char g = imgg[index];
        unsigned char b = imgb[index];

        // Minimize calculation steps with precomputed constants
        img_gray[index] = (unsigned char)( 0.299f * r + 0.587f * g + 0.114f * b);
    }
}