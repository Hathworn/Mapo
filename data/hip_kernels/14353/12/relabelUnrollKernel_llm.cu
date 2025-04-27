#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void relabelUnrollKernel(int *components, int previousLabel, int newLabel, const int colsComponents, const int idx, const int frameRows, const int factor) {
    // Use the linear thread id as vectorized index calculation
    uint id_i_child = (blockIdx.x * blockDim.x) + threadIdx.x + (frameRows * idx);
    uint id_j_child = blockIdx.y * blockDim.y + threadIdx.y;
    uint stride = gridDim.y * blockDim.y; // Calculate stride for coalesced access

    // Iterate with stride for better memory coalescing
    for (int j = id_j_child; j < (colsComponents / factor); j += stride) {
        int index = i * colsComponents + j; // Computation done once
        if (components[index] == previousLabel) {
            components[index] = newLabel;
        }
    }
}