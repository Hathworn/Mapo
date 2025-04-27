#include "hip/hip_runtime.h"
#include "includes.h"
/*******************************************************************************
*
*******************************************************************************/

/*************************************************************************

/*************************************************************************/

/*************************************************************************/
__global__ void drawColor(unsigned char* optr, const float* red, const float* green, const float* blue) {
    // Map from threadIdx/BlockIdx to pixel position
    int x = threadIdx.x + blockIdx.x * blockDim.x;
    int y = threadIdx.y + blockIdx.y * blockDim.y;
    int offset = x + y * blockDim.x * gridDim.x;

    // Early exit if offset exceeds output size
    if (offset >= blockDim.x * gridDim.x * blockDim.y * gridDim.y) return;

    // Clamp and convert color components
    float theRed = fminf(fmaxf(red[offset], 0.0f), 1.0f);
    float theGreen = fminf(fmaxf(green[offset], 0.0f), 1.0f);
    float theBlue = fminf(fmaxf(blue[offset], 0.0f), 1.0f);

    // Write output color values
    optr[offset * 4 + 0] = static_cast<unsigned char>(255 * theRed);    // red
    optr[offset * 4 + 1] = static_cast<unsigned char>(255 * theGreen);  // green
    optr[offset * 4 + 2] = static_cast<unsigned char>(255 * theBlue);   // blue
    optr[offset * 4 + 3] = 255;                                         // alpha (opacity)
}