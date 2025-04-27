#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void projectionProfileVerticalCuda( const uint8_t * image, uint32_t rowSize, uint32_t width, uint32_t height, uint32_t * projection )
{
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    // Combine bounds check and atomic operation to minimize thread divergence
    if ( x < width ) {
        atomicAdd( &projection[y], image[y * rowSize + x] );
    }
}