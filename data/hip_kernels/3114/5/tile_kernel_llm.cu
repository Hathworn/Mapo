#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void tile_kernel(const float* in, float* out, int num_planes, int num_rows, int num_cols) {
    // Calculate global thread ID
    const int gid = blockIdx.x * blockDim.x + threadIdx.x;
    const int elems_per_plane = num_rows * num_cols;
    
    // Calculate plane and row indices
    const int plane = gid / num_rows;
    const int row = gid % num_rows;
    
    // Early exit if plane index is out of bounds
    if (plane >= num_planes) return;
    
    // Copy the entire row in one go
    for (int col = 0; col < num_cols; ++col) {
        // Use of shared memory buffer or coalesced memory access could be optimized here
        out[plane * elems_per_plane + row * num_cols + col] = in[plane * num_cols + col];
    }
}