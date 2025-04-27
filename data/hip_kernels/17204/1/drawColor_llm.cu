#include "hip/hip_runtime.h"
#include "includes.h"

/*************************************************************************/
__global__ void drawColor(unsigned char* optr, const float* red, const float* green, const float* blue) {
    // Calculate unique thread index for flattened 2D grid
    int x = threadIdx.x + blockIdx.x * blockDim.x;
    int y = threadIdx.y + blockIdx.y * blockDim.y;
    int offset = x + y * blockDim.x * gridDim.x;

    // Use __saturatef to clamp values between 0 and 1
    float theRed = __saturatef(red[offset]);
    float theGreen = __saturatef(green[offset]);
    float theBlue = __saturatef(blue[offset]);

    // Use optimized packing to store results
    optr[offset * 4 + 0] = __float2uint_rd(theRed * 255.0f);
    optr[offset * 4 + 1] = __float2uint_rd(theGreen * 255.0f);
    optr[offset * 4 + 2] = __float2uint_rd(theBlue * 255.0f);
    optr[offset * 4 + 3] = 255; // Alpha (constant)
}