#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_WIDTH 24
#define MAXPOOL_INPUT_FILENAME "input.txt"
#define A_FILENAME "a.txt"
#define B_FILENAME "b.txt"
#define C_FILENAME "c.txt"

using namespace std;

__global__ void gemm(float *a, float *b, float *c, const float alpha, const float beta, float *output, const int input_size){
    int tx = threadIdx.x, ty = threadIdx.y;
    int bx = blockIdx.x, by = blockIdx.y;

    int row = by * blockDim.y + ty;
    int col = bx * blockDim.x + tx;

    if(row >= input_size || col >= input_size) { return; }

    __shared__ float s_a[TILE_WIDTH][TILE_WIDTH];
    __shared__ float s_b[TILE_WIDTH][TILE_WIDTH];

    float result = 0;

    for(int p = 0; p < input_size/TILE_WIDTH + 1; p++){
        int a_index = row * input_size + p * TILE_WIDTH + tx;
        int b_index = (p * TILE_WIDTH + ty) * input_size + col;

        // Load tiles into shared memory
        s_a[ty][tx] = (a_index < input_size * input_size) ? a[a_index] : 0;
        s_b[ty][tx] = (b_index < input_size * input_size) ? b[b_index] : 0;

        __syncthreads(); // Synchronize to ensure tiles are loaded

        // Compute partial matrix product
        for(int i = 0; i < TILE_WIDTH; i++) {
            result += s_a[ty][i] * s_b[i][tx];
        }

        __syncthreads(); // Synchronize before loading new tiles
    }

    if(row < input_size && col < input_size) {
        // Write result to output matrix
        output[row * input_size + col] = (alpha * result) + (beta * c[row * input_size + col]);
    }
}