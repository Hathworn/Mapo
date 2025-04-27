#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void histogram_equalization(int *lut, unsigned char *img_out, unsigned char *img_in, int img_size) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Check within image bound
    if(id < img_size) {
        // Efficient condition check and output assignment
        unsigned char value = lut[img_in[id]] > 255 ? 255 : (unsigned char)lut[img_in[id]];
        img_out[id] = value;
    }
}