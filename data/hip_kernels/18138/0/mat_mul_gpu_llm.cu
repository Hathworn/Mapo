#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mat_mul_gpu(float* vec_one, float* vec_two, float* ret_vec, int vec_one_row, int vec_one_col, int vec_two_col) {
    // Compute global thread coordinates
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Linearize coordinates for data access
    if ((row < vec_one_row) && (col < vec_two_col)) {
        float cum_sum = 0.0;

        // Unroll loop for better performance
        #pragma unroll
        for (int k = 0; k < vec_one_col; k++) {
            cum_sum += vec_one[row * vec_one_col + k] * vec_two[k * vec_two_col + col];
        }
        ret_vec[row * vec_two_col + col] = cum_sum;
    }
}