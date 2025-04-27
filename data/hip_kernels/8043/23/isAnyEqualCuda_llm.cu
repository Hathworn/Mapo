#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void isAnyEqualCuda( const uint8_t * image, uint8_t * value, size_t valueCount, uint32_t width, uint32_t height, uint32_t * differenceCount )
{
    // Calculate the unique thread index
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;
    
    // Ensure the thread is within image bounds
    if (x >= width || y >= height) return;
    
    const uint32_t id = y * width + x;
    bool equal = false;
    
    // Iterate through values to check for matches
    for (uint32_t i = 0; i < valueCount; i++)
    {
        if (image[id] == value[i])
        {
            equal = true;
            break;  // Exit loop early if match is found
        }
    }
    
    // If any match was found, use atomic increment to update differenceCount
    if (equal)
    {
        atomicAdd(differenceCount, 1);
    }
}