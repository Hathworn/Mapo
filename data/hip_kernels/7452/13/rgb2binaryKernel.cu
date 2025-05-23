#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void rgb2binaryKernel(unsigned char *imgr,unsigned char *imgg,unsigned char *imgb,unsigned char *img_binary, int n, int umbral) {

int r, g, b;
int index = threadIdx.x + blockIdx.x * blockDim.x;

if (index < n){
r = imgr[index];
g = imgg[index];
b = imgb[index];

img_binary[index] = (unsigned char)( 0.299*r + 0.587*g +  0.114*b)>umbral?255:0;
}
}