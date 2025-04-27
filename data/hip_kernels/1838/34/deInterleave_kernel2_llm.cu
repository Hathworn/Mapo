#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void deInterleave_kernel2(float *d_X_out, float *d_Y_out, char *d_XY_in, int pitch_out, int pitch_in, int width, int height) {
    unsigned int x = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int y = blockIdx.y * blockDim.y + threadIdx.y;

    if (x < width && y < height) { // Check within image bounds
        char *input_ptr = d_XY_in + y * pitch_in; // Precompute address
        float *data = (float *)(input_ptr) + 2 * x;
        
        char *output_ptr_x = (char *)d_X_out + y * pitch_out; // Precompute output address for X
        *((float *)output_ptr_x + x) = data[0];

        char *output_ptr_y = (char *)d_Y_out + y * pitch_out; // Precompute output address for Y
        *((float *)output_ptr_y + x) = data[1];
    }
}