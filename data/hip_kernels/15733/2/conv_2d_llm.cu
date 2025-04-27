#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void conv_2d(int* Mat, int* res, int n) {
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    if (row >= n || col >= n) return; // Early exit for out-of-bound threads

    int start_r = row - MASK_OFFSET;
    int start_c = col - MASK_OFFSET;

    int temp = 0;

    #pragma unroll // Unroll the loop for better performance
    for (int i = 0; i < MASK_LEN; i++) {
        #pragma unroll
        for (int j = 0; j < MASK_LEN; j++) {
            if ((start_r + i >= 0) && (start_r + i < n) && 
                (start_c + j >= 0) && (start_c + j < n)) {
                temp += Mat[(start_r + i) * n + (start_c + j)] * mask[i * MASK_LEN + j];
            }
        }
    }

    res[row * n + col] = temp;
}