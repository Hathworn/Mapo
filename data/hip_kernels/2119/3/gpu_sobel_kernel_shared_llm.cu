#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_sobel_kernel_shared(u_char *Source, u_char *Resultat, unsigned width, unsigned height) {
    __shared__ u_char tuile[BLOCKDIM_X][BLOCKDIM_Y];

    int x = threadIdx.x;
    int y = threadIdx.y;
    int i = blockIdx.y * (BLOCKDIM_Y-2) + y;
    int j = blockIdx.x * (BLOCKDIM_X-2) + x;

    int globalIndex = i * width + j;

    // Load pixels into shared memory
    if (i < height && j < width) {
        tuile[y][x] = Source[globalIndex];
    }
    __syncthreads();

    // Ensure threads operate within valid boundaries
    if (x > 0 && y > 0 && x < BLOCKDIM_X-1 && y < BLOCKDIM_Y-1 && i < height-1 && j < width-1) {
        u_char val_x = abs(tuile[y-1][x-1] + tuile[y-1][x] + tuile[y-1][x+1]
                         - tuile[y+1][x-1] - tuile[y+1][x] - tuile[y+1][x+1]);
        u_char val_y = abs(tuile[y-1][x-1] + tuile[y][x-1] + tuile[y+1][x-1]
                         - tuile[y-1][x+1] - tuile[y][x+1] - tuile[y+1][x+1]);
        Resultat[globalIndex] = val_x + val_y;
    }
}