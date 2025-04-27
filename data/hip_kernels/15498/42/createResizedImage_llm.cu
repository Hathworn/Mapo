#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void createResizedImage(unsigned char *imageScaledData, int scaled_width, float scale_factor, hipTextureObject_t texObj)
{
    // Calculate a single index for threads
    const unsigned int tidX = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int tidY = blockIdx.y * blockDim.y + threadIdx.y;
    const unsigned int index = tidY * scaled_width + tidX;

    // Ensure the thread is within bounds
    if (tidX < scaled_width && tidY * scaled_width < scaled_width * gridDim.y * blockDim.y) {
        // Use tex2D to access texture memory
        imageScaledData[index] = tex2D<unsigned char>(texObj, tidX * scale_factor, tidY * scale_factor);
    }
}