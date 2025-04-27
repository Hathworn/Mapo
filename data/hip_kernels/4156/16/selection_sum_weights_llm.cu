#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void selection_sum_weights(float * selection_sum, float * selection, int n, int stride) {
    int x = blockIdx.x * TILE_DIM + threadIdx.x;
    int y = blockIdx.y * TILE_DIM + threadIdx.y;
    int width = gridDim.x * TILE_DIM;
    float local_sum = 0.0f;
    
    // Loop unrolling for efficient memory access and computation
    #pragma unroll
    for (int j = 0; j < TILE_DIM; j += BLOCK_ROWS) {
        local_sum = 0.0f;
        for (int idx = 0; idx < n; idx++) {
            local_sum += selection[idx * stride + ((y + j) * width + x)];
        }
        atomicAdd(&(selection_sum[(y + j) * width + x]), local_sum);
    }
}