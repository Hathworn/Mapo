#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void minimumCuda( const uint8_t * in1, uint32_t rowSizeIn1, const uint8_t * in2, uint32_t rowSizeIn2, uint8_t * out, uint32_t rowSizeOut, uint32_t width, uint32_t height )
{
    // Calculate global thread coordinates
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    // Check boundary condition
    if ( x < width && y < height ) {
        // Compute the linear index for each input and result
        const uint32_t idxIn1 = y * rowSizeIn1 + x;
        const uint32_t idxIn2 = y * rowSizeIn2 + x;
        const uint32_t idxOut = y * rowSizeOut + x;
        
        // Perform minimum operation and write output
        out[idxOut] = min(in1[idxIn1], in2[idxIn2]);
    }
}