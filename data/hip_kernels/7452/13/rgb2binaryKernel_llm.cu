#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void rgb2binaryKernel(unsigned char *imgr, unsigned char *imgg, unsigned char *imgb, unsigned char *img_binary, int n, int umbral) {
    // Use shared memory for local variables to reduce global memory traffic
    __shared__ float cached_r[256]; 
    __shared__ float cached_g[256]; 
    __shared__ float cached_b[256];

    int index = threadIdx.x + blockIdx.x * blockDim.x;
    
    if (index < n) {
        // Cache data in shared memory
        cached_r[threadIdx.x] = 0.299f * imgr[index];
        cached_g[threadIdx.x] = 0.587f * imgg[index];
        cached_b[threadIdx.x] = 0.114f * imgb[index];

        // Calculate binary image using cached values
        img_binary[index] = (cached_r[threadIdx.x] + cached_g[threadIdx.x] + cached_b[threadIdx.x] > umbral) ? 255 : 0;
    }
}