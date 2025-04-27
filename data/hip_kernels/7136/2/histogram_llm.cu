#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void histogram( int * hist_out, unsigned char * img_in, int img_w,int img_h,  int nbr_bin){

    int tx = threadIdx.x;
    int ty = threadIdx.y;
    int bx = blockIdx.x;
    int by = blockIdx.y;

    __shared__ int smem[256];
    
    // Initialize shared memory array using one thread
    if (tx == 0 && ty == 0) {
        for (int i = 0; i < 256; i++) {
            smem[i] = 0;
        }
    }
    __syncthreads();

    unsigned int col = tx + blockDim.x * bx;
    unsigned int row = ty + blockDim.y * by;

    int grid_width = gridDim.x * blockDim.x;
    int id = row * grid_width + col;

    // Ensure threads go out of bounds
    if (row < img_w && col < img_h) {
        atomicAdd(&(smem[img_in[id]]), 1);
    }

    __syncthreads();

    // Atomic add to global histogram using single block thread
    if (tx == 0 && ty == 0) {
        for (int i = 0; i < 256; i++) {
            atomicAdd(&(hist_out[i]), smem[i]);
        }
    }
}