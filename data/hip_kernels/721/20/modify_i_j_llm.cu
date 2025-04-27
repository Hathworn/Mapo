#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void modify_i_j(int width, int height, int pitch, float *d_array, int i, int j, float change_to) {
    // Utilizing block and thread for efficient indexing
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate row index
    int idy = blockIdx.y * blockDim.y + threadIdx.y; // Calculate column index

    // Ensure we are within the array bounds
    if (idx < width && idy < height) {
        // More efficient indexing and only modify the desired element
        if ((idx == i) && (idy == j)) {
            d_array[idx * (pitch / sizeof(float)) + idy] = change_to;
        }
    }
}