#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_transpo_kernel_shared(u_char *Source, u_char *Resultat, unsigned width, unsigned height) {
    __shared__ u_char tuile[BLOCKDIM_X][BLOCKDIM_Y+1];

    int x = threadIdx.x;
    int y = threadIdx.y;
    int i = blockIdx.y * BLOCKDIM_Y + y;
    int j = blockIdx.x * BLOCKDIM_X + x;

    // Check bounds to avoid unnecessary calculations
    if (i < height && j < width) {
        tuile[y][x] = Source[i * width + j];
    }
    __syncthreads();

    // Recalculate indices for efficient transpose writing
    i = blockIdx.y * BLOCKDIM_Y + x;
    j = blockIdx.x * BLOCKDIM_X + y;

    // Check bounds for transpose writing
    if (j < height && i < width) {
        Resultat[j * height + i] = tuile[x][y];
    }
}