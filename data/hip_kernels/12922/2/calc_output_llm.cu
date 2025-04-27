#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calc_output(unsigned char * img_out, unsigned char * img_in, int * lut, int img_size) {
    // Calculate the global thread index
    int ix = blockIdx.x * blockDim.x + threadIdx.x;
    int iy = blockIdx.y * blockDim.y + threadIdx.y;
    const int gridW = gridDim.x * blockDim.x;
    int img_position1 = iy * gridW + ix;

    // Process only valid image positions
    if (img_position1 < img_size) {
        int lut_value = lut[img_in[img_position1]];
        // Use conditional operator for compactness
        img_out[img_position1] = (unsigned char)(lut_value > 255 ? 255 : lut_value);
    }
}