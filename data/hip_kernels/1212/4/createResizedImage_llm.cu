#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void createResizedImage(unsigned char *imageScaledData, int scaled_width, float scale_factor, hipTextureObject_t texObj)
{
    const unsigned int tidX = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int tidY = blockIdx.y * blockDim.y + threadIdx.y;
    
    if (tidX < scaled_width && tidY < scaled_width) // Ensure index is within bounds
    {
        const unsigned index = tidY * scaled_width + tidX;

        // Read from texture memory and assign to output
        imageScaledData[index] = tex2D<unsigned char>(texObj, (float)(tidX * scale_factor), (float)(tidY * scale_factor));
    }
}