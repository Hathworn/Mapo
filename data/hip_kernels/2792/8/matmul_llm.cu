#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matmul(const float_t *A, const float_t *B, float_t *C, const float_t alpha, const float_t beta, int n, int d, int k, int max_block_rows) {
    extern __shared__ __align__(sizeof(float_t)) unsigned char my_smem[];
    float_t *shared = reinterpret_cast<float_t *>(my_smem);

    float_t *s_A = shared;
    float_t *s_B = shared + max_block_rows * d;

    // Load B matrix into shared memory
    for (int idx = threadIdx.x; idx < d * k; idx += blockDim.x) {
        s_B[idx] = B[idx];
    }

    size_t block_start_row_index = blockIdx.x * max_block_rows;
    size_t block_rows = max_block_rows;

    if (blockIdx.x == gridDim.x - 1 && n % max_block_rows != 0) {
        block_rows = n % max_block_rows;
    }

    // Load part of A matrix into shared memory
    for (size_t idx = threadIdx.x; idx < d * block_rows; idx += blockDim.x) {
        s_A[idx] = alpha * A[d * block_start_row_index + idx];
    }

    __syncthreads();

    // Ensure thread responsibility is within the problem bounds
    int col_c = threadIdx.x % k;
    size_t abs_row_c = block_start_row_index + threadIdx.x / k;
    if (abs_row_c >= n || threadIdx.x >= block_rows * k) {
        return;
    }

    float_t elem_c = 0;
    int row_c = threadIdx.x / k;

    // Compute matrix multiplication result
    for (size_t i = 0; i < d; i++) {
        elem_c += s_B[d * col_c + i] * s_A[d * row_c + i];
    }

    // Write result to C matrix with modification of existing values
    atomicAdd(&C[col_c * n + abs_row_c], beta * C[col_c * n + abs_row_c] + elem_c);
}