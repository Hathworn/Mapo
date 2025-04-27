#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void histogram_equalization_gpu_son (unsigned char * d_in, unsigned char * d_out, int * d_lut, int img_size, int serialNum)
{
    // Calculate global thread index
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check if thread index is within image bounds
    if (x < img_size) {
        // Perform histogram equalization using lookup table
        d_out[x] = (unsigned char) d_lut[d_in[x]];
    }
}