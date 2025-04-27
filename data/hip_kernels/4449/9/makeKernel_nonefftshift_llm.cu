#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void makeKernel_nonefftshift(float* KernelPhase, int row, int column, float* ImgProperties) {
    // Cache ImgProperties in shared memory for faster access
    __shared__ float sharedImgProps[5];
    if (threadIdx.x < 5) {
        sharedImgProps[threadIdx.x] = ImgProperties[threadIdx.x];
    }
    __syncthreads();

    const int numThreads = blockDim.x * gridDim.x;
    const int threadID = blockIdx.x * blockDim.x + threadIdx.x;
    // Use registers for frequently accessed variables
    float pixSize = sharedImgProps[0];
    float MagX = sharedImgProps[1];
    float nmed = sharedImgProps[2];
    float lambda = sharedImgProps[3];
    float MagXscaling = 1.0f / sharedImgProps[4];
    float pixdxInv = MagX / pixSize * MagXscaling; // Magnification/pixSize
    float km = nmed / lambda; // nmed / lambda

    for (int i = threadID; i < row * column; i += numThreads) {
        int dx = i % row;
        int dy = i / row;
        
        // Use bitwise operations for conditional assignments
        dx -= (dx >= row / 2) * row;
        dy -= (dy >= row / 2) * row;

        float kdx = dx * pixdxInv;
        float kdy = dy * pixdxInv;
        float temp = km * km - kdx * kdx - kdy * kdy;
        KernelPhase[i] = (temp >= 0) ? (sqrtf(temp) - km) : 0;
    }
}