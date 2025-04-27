#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void histogram(int *hist_out, unsigned char *img_in, int img_w, int img_h, int nbr_bin) {
    // Using shared memory for temporary storage
    extern __shared__ int shared_hist[];
    
    int tx = threadIdx.x;
    int ty = threadIdx.y;
    int bx = blockIdx.x;
    int by = blockIdx.y;

    unsigned int col = tx + blockDim.x * bx;
    unsigned int row = ty + blockDim.y * by;
    int grid_width = gridDim.x * blockDim.x;
    int id = row * grid_width + col;

    // Initialize shared memory
    if (id < nbr_bin)
        shared_hist[id] = 0;

    __syncthreads();

    if (row < img_h && col < img_w) {
        atomicAdd(&(shared_hist[img_in[id]]), 1);
    }

    __syncthreads();

    // Write results back to global memory
    if (id < nbr_bin) {
        atomicAdd(&(hist_out[id]), shared_hist[id]);
    }
}