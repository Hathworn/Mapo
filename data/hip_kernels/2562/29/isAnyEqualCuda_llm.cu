#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void isAnyEqualCuda( const uint8_t * image, uint8_t * value, size_t valueCount, uint32_t width, uint32_t height, uint32_t * differenceCount )
{
    // Calculate x and y indices
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    // Check if indices are within bounds
    if ( x < width && y < height ) {
        const uint32_t id = y * width + x; // Linear index calculation

        bool equal = false;
        
        // Loop unrolling for faster comparison
        #pragma unroll
        for ( uint32_t i = 0; i < valueCount; ++i ) {
            if ( image[id] == value[i] ) {
                equal = true;
                break;
            }
        }

        // Atomic operation to increment differenceCount
        if ( equal )
            atomicAdd( differenceCount, 1 );
    }
}