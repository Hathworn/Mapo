#include "hip/hip_runtime.h"
#include "includes.h"

#define HISTOGRAM_LENGTH 256

__global__ void convertToGrayScale(unsigned char * ucharImg, unsigned char * grayImg, int width, int height)
{
    // Calculate unique thread index
    int index = blockIdx.y * blockDim.y * width + blockIdx.x * blockDim.x + threadIdx.y * width + threadIdx.x;

    if (index < width * height) // Ensure index is within the image range
    {
        grayImg[index] = (unsigned char) (0.21*ucharImg[index*3] + 0.71*ucharImg[index*3 + 1] + 0.07*ucharImg[index*3 + 2]);
    }
}