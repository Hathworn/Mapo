#include "hip/hip_runtime.h"
#include "includes.h"

#define SEED
#define BLOCK_SIZE 32

typedef struct _data {
    char * values;
    char * next_values;
    int width;
    int height;
} data;

__global__ void operate(char * source, char * goal, int sizex, int sizey) {
    // Load relevant elements into shared memory with halo
    __shared__ char local[BLOCK_SIZE + MASK_WIDTH - 1][BLOCK_SIZE + MASK_WIDTH - 1];
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    int prim_x = j - MASK_RADIUS;
    int prim_y = i - MASK_RADIUS;

    // Load data into shared memory using halo
    for(int di = threadIdx.y; di < BLOCK_SIZE + MASK_WIDTH - 1; di += BLOCK_SIZE) {
        for(int dj = threadIdx.x; dj < BLOCK_SIZE + MASK_WIDTH - 1; dj += BLOCK_SIZE) {
            int global_i = prim_y + di;
            int global_j = prim_x + dj;
            if(global_i >= 0 && global_i < sizey && global_j >= 0 && global_j < sizex) {
                local[di][dj] = source[global_i * sizex + global_j];
            } else {
                local[di][dj] = '0';
            }
        }
    }
    __syncthreads();

    // Process each cell
    if(i < sizey && j < sizex) {
        int amount = 0;
        for(int l_i = 0; l_i < MASK_WIDTH; ++l_i) {
            for(int l_j = 0; l_j < MASK_WIDTH; ++l_j) {
                if(local[threadIdx.y + l_i][threadIdx.x + l_j] == '1') {
                    amount++;
                }
            }
        }

        if(source[i * sizex + j] == '1') {
            amount--;
            goal[i * sizex + j] = (amount < 2 || amount > 3) ? '0' : '1';
        } else {
            goal[i * sizex + j] = (amount == 3) ? '1' : '0';
        }
    }
}