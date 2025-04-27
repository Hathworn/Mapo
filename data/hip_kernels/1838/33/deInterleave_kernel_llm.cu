#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void deInterleave_kernel(float *d_X_out, float *d_Y_out, float2 *d_XY_in, int pitch_out, int pitch_in, int width, int height) {
    unsigned int x = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int y = blockIdx.y * blockDim.y + threadIdx.y;

    if (x < width && y < height) { // Check within image bounds using short-circuit AND
        float2 XY = *((float2*) ((char*) d_XY_in + y * pitch_in) + x); // Load input in a coalesced way
        float *out_x = (float*)((char*) d_X_out + y * pitch_out) + x;
        float *out_y = (float*)((char*) d_Y_out + y * pitch_out) + x;
        *out_x = XY.x; // Store X value
        *out_y = XY.y; // Store Y value
    }
}