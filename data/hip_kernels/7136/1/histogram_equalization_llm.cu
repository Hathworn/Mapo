```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void histogram_equalization(int *lut, unsigned char *img_out, unsigned char *img_in, int *hist_in, int img_size, int nbr_bin) {
    // Optimize thread index calculations by using predefined variables
    int tx = threadIdx.x + blockIdx.x * blockDim.x;
    int ty = threadIdx.y + blockIdx.y * blockDim.y;
    int id = ty * blockDim.x * gridDim.x + tx;

    // Check if the thread ID is within the image size bounds
    if (id < img_size) {
        // Fetch lut value and clamp to 255 if necessary
        int lut_value = lut[img_in[id]];
        img_out[id] = (unsigned char)(lut_value > 255 ? 255 : lut_value);
    }
}