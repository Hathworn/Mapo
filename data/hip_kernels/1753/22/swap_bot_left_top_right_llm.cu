#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void swap_bot_left_top_right(float* data, const int num_threads, const int nx, const int ny, const int xodd, const int yodd, const int offset) {
    const uint x = threadIdx.x;
    const uint y = blockIdx.x;
    
    // Calculate global index directly using faster operations
    const uint gpu_idx = x + y * num_threads + offset;
    const uint row_size_half = nx / 2;
    
    // Compute column and row indices more efficiently
    const uint c = gpu_idx % row_size_half;
    const uint r = gpu_idx / row_size_half;
    
    // Pre-calculate reused values
    const uint r_offset = r * nx;
    const uint idx1 = r_offset + c;
    const uint idx2 = (r + ny / 2 + yodd) * nx + c + row_size_half + xodd;
    
    // Perform the swap operation
    float tmp = data[idx1];
    data[idx1] = data[idx2];
    data[idx2] = tmp;
}