#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void deInterleave_kernel2(float *d_X_out, float *d_Y_out, char *d_XY_in, int pitch_out, int pitch_in, int width, int height) {
    unsigned int x = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int y = blockIdx.y * blockDim.y + threadIdx.y;

    if ((x < width) && (y < height)) { // Ensure both conditions must be true
        // Calculate source and destination pointers directly with proper types
        float2 *data = (float2 *)(d_XY_in + y * pitch_in) + x;
        float *destX = (float *)((char *)d_X_out + y * pitch_out) + x;
        float *destY = (float *)((char *)d_Y_out + y * pitch_out) + x;
        
        // Fetch and store data
        *destX = data->x;
        *destY = data->y;
    }
}