#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_Comput (int *h, int N, int T) {
    // Calculate linear global thread ID
    int col = threadIdx.x + blockDim.x * blockIdx.x;
    int row = threadIdx.y + blockDim.y * blockIdx.y;
    int index = row * N + col;  // Efficient index calculation

    // Loop through T iterations
    for (int t = 0; t < T; t++) {
        h[index] = index;  // Store the computed index directly
    }
}