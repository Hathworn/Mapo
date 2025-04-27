#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void histogram_equalization(int *lut, unsigned char *img_out, unsigned char *img_in, int *hist_in, int img_size, int nbr_bin) {
    int tx = threadIdx.x;
    int ty = threadIdx.y;
    int bx = blockIdx.x;
    int by = blockIdx.y;
    
    // Load LUT into shared memory; potentially coalesced memory access
    __shared__ int smem[256];
    if (tx < nbr_bin) {
        smem[tx] = lut[tx];
    }
    __syncthreads();
    
    unsigned int col = tx + blockDim.x * bx;
    unsigned int row = ty + blockDim.y * by;
    int grid_width = gridDim.x * blockDim.x;
    int id = row * grid_width + col;
    
    // Ensure global memory access is within bounds and write directly to img_out
    if (id < img_size) {
        unsigned char pixel_value = img_in[id];
        img_out[id] = smem[pixel_value] > 255 ? 255 : (unsigned char)smem[pixel_value];
    }
}