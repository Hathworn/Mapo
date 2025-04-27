#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void createResizedImage(unsigned char *imageScaledData, int scaled_width, float scale_factor, hipTextureObject_t texObj) {
    // Calculate thread index in a coalesced manner for better memory access pattern
    const unsigned int tidX = blockIdx.x*blockDim.x + threadIdx.x;
    const unsigned int tidY = blockIdx.y*blockDim.y + threadIdx.y;
    const unsigned int index = tidY * scaled_width + tidX;

    // Ensure that the thread index is within the valid range
    if (tidX < scaled_width && tidY < scaled_width) {
        // Optimized texture fetching; coalesced memory access
        imageScaledData[index] = tex2D<unsigned char>(texObj, tidX * scale_factor, tidY * scale_factor);
    }
}