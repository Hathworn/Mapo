#include "hip/hip_runtime.h"
#include "includes.h"
/*******************************************************************************
*
*******************************************************************************/

/*************************************************************************

/*************************************************************************/

/*************************************************************************/
__global__ void drawGray(unsigned char* optr, const float* outSrc) {
    // Use block and thread indices to compute the pixel position
    int x = threadIdx.x + blockIdx.x * blockDim.x;
    int y = threadIdx.y + blockIdx.y * blockDim.y;
    int offset = x + y * blockDim.x * gridDim.x;

    // Load and normalize the value
    float val = outSrc[offset];
    val = fminf(fmaxf((val / 50.0f) + 0.5f, 0.0f), 1.0f);  // Clamp the normalized value

    // Pack the RGB values using a single operation
    unsigned char intensity = static_cast<unsigned char>(255 * val);
    int pixelOffset = offset * 4;
    optr[pixelOffset] = intensity;     // red
    optr[pixelOffset + 1] = intensity; // green
    optr[pixelOffset + 2] = intensity; // blue
    optr[pixelOffset + 3] = 255;       // alpha
}