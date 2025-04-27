#include "hip/hip_runtime.h"
#include "includes.h"

#define N 9
#define K N/3
#define ThreadsPerBlock K
#define NumBlocks K

__global__ void compress(float *mat, int n, float *comp, int k) {
    int row = threadIdx.y + blockIdx.y * blockDim.y;
    int col = threadIdx.x + blockIdx.x * blockDim.x;

    // Only proceed if within matrix bounds
    if (row < k && col < k) {
        float sum = 0.0f; // Initialize sum for each element
        for (int i_row = 0; i_row < k; i_row++) {
            for (int j_col = 0; j_col < k; j_col++) {
                sum += mat[(col + j_col) + (row + i_row) * n]; // Accumulate values
            }
        }
        comp[col + row * k] = sum; // Assign accumulated sum to output
    }
}