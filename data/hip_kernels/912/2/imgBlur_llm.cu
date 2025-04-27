#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float getPixelValue(float* img, int x, int y, int width, int height) {
    if (x >= 0 && x < width && y >= 0 && y < height) {
        return img[y * width + x];
    }
    return 0.0f;
}

__global__ void imgBlur(float* imgIn, float* imgOut, int imageWidth, int imageHeight)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int idy = blockIdx.y * blockDim.y + threadIdx.y;

    // Check within bounds
    if(idx < imageWidth && idy < imageHeight)
    {
        float sum = 0.0f;
        // Optimize access by pre-calculating positions
        sum += getPixelValue(imgIn, idx, idy, imageWidth, imageHeight);
        sum += getPixelValue(imgIn, idx-1, idy-1, imageWidth, imageHeight);
        sum += getPixelValue(imgIn, idx-1, idy, imageWidth, imageHeight);
        sum += getPixelValue(imgIn, idx+1, idy, imageWidth, imageHeight);
        sum += getPixelValue(imgIn, idx+1, idy+1, imageWidth, imageHeight);
        sum += getPixelValue(imgIn, idx+1, idy-1, imageWidth, imageHeight);
        sum += getPixelValue(imgIn, idx, idy-1, imageWidth, imageHeight);
        sum += getPixelValue(imgIn, idx, idy+1, imageWidth, imageHeight);
        sum += getPixelValue(imgIn, idx-1, idy+1, imageWidth, imageHeight);

        imgOut[idy * imageWidth + idx] = sum / (float)(BLUR_SIZE * BLUR_SIZE);
    }
}