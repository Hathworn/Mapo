#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calc_output(unsigned char * img_out, unsigned char * img_in, int * lut, int img_size) {
    // Calculate pixel index in the image
    int ix = blockIdx.x * blockDim.x + threadIdx.x;
    int iy = blockIdx.y * blockDim.y + threadIdx.y;
    int img_position = iy * (gridDim.x * blockDim.x) + ix;

    // Check if the pixel index is within image bounds
    if (img_position < img_size) {
        // Clamp LUT value to [0, 255] and assign to output image
        img_out[img_position] = min(255, lut[img_in[img_position]]);
    }
}