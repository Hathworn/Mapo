#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Sobel_Kernel(unsigned int* pic, int* result, int xsize, int ysize, int thresh)
{
    // Calculate the global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int idy = blockIdx.y * blockDim.y + threadIdx.y;

    // Early exit threads that are out of bounds
    if (idx >= xsize || idy >= ysize) return;

    // Load shared memory for neighboring pixels (considering block boundaries)
    extern __shared__ unsigned int sharedPic[];
    int sharedIdx = threadIdx.x + 1;
    int sharedIdy = threadIdx.y + 1;
    int sharedWidth = blockDim.x + 2;

    // Load current pixel
    sharedPic[sharedIdx + sharedIdy * sharedWidth] = pic[idx + idy * xsize];

    // Load border pixels into shared memory
    if (threadIdx.x == 0 && idx > 0) 
        sharedPic[sharedIdx - 1 + sharedIdy * sharedWidth] = pic[idx - 1 + idy * xsize];
    if (threadIdx.x == blockDim.x - 1 && idx < xsize - 1) 
        sharedPic[sharedIdx + 1 + sharedIdy * sharedWidth] = pic[idx + 1 + idy * xsize];
    if (threadIdx.y == 0 && idy > 0) 
        sharedPic[sharedIdx + (sharedIdy - 1) * sharedWidth] = pic[idx + (idy - 1) * xsize];
    if (threadIdx.y == blockDim.y - 1 && idy < ysize - 1) 
        sharedPic[sharedIdx + (sharedIdy + 1) * sharedWidth] = pic[idx + (idy + 1) * xsize];

    __syncthreads();

    // Apply Sobel Operator using shared memory
    int gx = sharedPic[sharedIdx - 1 + (sharedIdy - 1) * sharedWidth] - sharedPic[sharedIdx + 1 + (sharedIdy - 1) * sharedWidth] +
             2 * sharedPic[sharedIdx - 1 + sharedIdy * sharedWidth] - 2 * sharedPic[sharedIdx + 1 + sharedIdy * sharedWidth] +
             sharedPic[sharedIdx - 1 + (sharedIdy + 1) * sharedWidth] - sharedPic[sharedIdx + 1 + (sharedIdy + 1) * sharedWidth];

    int gy = sharedPic[sharedIdx - 1 + (sharedIdy - 1) * sharedWidth] + 2 * sharedPic[sharedIdx + (sharedIdy - 1) * sharedWidth] + sharedPic[sharedIdx + 1 + (sharedIdy - 1) * sharedWidth] -
             sharedPic[sharedIdx - 1 + (sharedIdy + 1) * sharedWidth] - 2 * sharedPic[sharedIdx + (sharedIdy + 1) * sharedWidth] - sharedPic[sharedIdx + 1 + (sharedIdy + 1) * sharedWidth];

    // Calculate edge magnitude
    int edgeVal = sqrtf((float)(gx * gx + gy * gy));

    // Apply threshold
    result[idx + idy * xsize] = (edgeVal > thresh) ? 255 : 0;
}