#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_WIDTH 32
#define TILE_HEIGHT 32

using namespace std;

struct matrix {
    unsigned int rows;	
    unsigned int cols;	
};

__global__ void matrix_mult(float* array1, unsigned int rows1, unsigned int cols1, float* array2, unsigned int rows2, unsigned int cols2, float* array3) {
    __shared__ float S1[TILE_WIDTH][TILE_HEIGHT];
    __shared__ float S2[TILE_HEIGHT][TILE_WIDTH];

    unsigned int tx = threadIdx.x;
    unsigned int ty = threadIdx.y;
    unsigned int c = blockIdx.x * blockDim.x + tx;
    unsigned int r = blockIdx.y * blockDim.y + ty;
    unsigned int idx = c * rows1 + r;
    
    float val = 0;

    for (int m = 0; m < 1 + ((rows2 - 1) / TILE_WIDTH); m++) {
        int var1 = m * TILE_WIDTH + tx;
        int var2 = m * TILE_WIDTH + ty;

        // Optimize shared memory loading
        S1[ty][tx] = (r < rows1 && var1 < rows2) ? array1[r + var1 * rows1] : 0.0f;
        S2[ty][tx] = (c < cols2 && var2 < rows2) ? array2[var2 + rows2 * c] : 0.0f;

        __syncthreads();

        for (int i = 0; i < TILE_WIDTH; i++) {
            val += S1[ty][i] * S2[i][tx];
        }

        __syncthreads();
    }

    // Store result if within bounds
    if (r < rows1 && c < cols2) {
        array3[idx] = val;
    }
}