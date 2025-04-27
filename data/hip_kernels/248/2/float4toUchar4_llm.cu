#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void float4toUchar4(float4 *inputImage, uchar4 *outputImage, int width, int height)
{
    // Calculate 1D offset for global memory access.
    int offset = (blockIdx.y * gridDim.x + blockIdx.x) * blockDim.x * blockDim.y + threadIdx.y * blockDim.x + threadIdx.x;
    
    // Ensure offset is within image bounds
    if (offset < width * height) {
        float4 pixelf = inputImage[offset];
        uchar4 pixel;
        pixel.x = (unsigned char) pixelf.x; 
        pixel.y = (unsigned char) pixelf.y;
        pixel.z = (unsigned char) pixelf.z; 
        pixel.w = (unsigned char) pixelf.w;
        
        outputImage[offset] = pixel;
    }
}