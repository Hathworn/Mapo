#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void convolution1d_tiles_constant_kernel(int *In, int *Out) {
    unsigned int index = blockIdx.x * blockDim.x + threadIdx.x; // Index 1d iterator.
    __shared__ int Tile[TILE_SIZE + Mask_size - 1];
    int n = Mask_size / 2;

    // Load left halo elements into shared memory
    int halo_left_index = index - n;
    if (threadIdx.x >= blockDim.x - n) {
        Tile[threadIdx.x - (blockDim.x - n)] = (halo_left_index < 0) ? 0 : In[halo_left_index];
    }

    // Load centre elements into shared memory
    Tile[n + threadIdx.x] = (index < N_elements) ? In[index] : 0;

    // Load right halo elements into shared memory
    int halo_right_index = index + blockDim.x;
    if (threadIdx.x < n) {
        Tile[n + blockDim.x + threadIdx.x] = (halo_right_index >= N_elements) ? 0 : In[halo_right_index];
    }

    __syncthreads();

    // Compute convolution using shared memory
    int Value = 0;
    for (unsigned int j = 0; j < Mask_size; j++) {
        Value += Tile[threadIdx.x + j] * Global_Mask[j];
    }

    // Store the result
    if (index < N_elements) {
        Out[index] = Value;
    }
}