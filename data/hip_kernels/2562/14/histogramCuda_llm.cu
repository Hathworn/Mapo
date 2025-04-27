```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void histogramCuda( const uint8_t * data, uint32_t rowSize, uint32_t width, uint32_t height, uint32_t * histogram )
{
    // Calculate global thread ID only once
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    if ( x < width && y < height ) {
        // Direct index calculation using predefined variables
        const uint32_t id = y * rowSize + x;
        
        // Use register variable for data access to reduce memory latency
        uint8_t dataValue = data[id];
        
        // Atomic add operation for histogram update
        atomicAdd( &histogram[dataValue], 1 );
    }
}