#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrix_softmax_cross_entropy_kernel(int nrow, int ncol, const float *input_a, const float *input_b, float *output) {
    extern __shared__ float loss_per_row[];
    int y = blockIdx.x * blockDim.x + threadIdx.x;  // Simplify thread index calculation
    if (y >= nrow) return;

    input_a += y * ncol;
    input_b += y * ncol;

    // Use shared memory for maxval and sum computation
    float maxval = -FLT_MAX;
    for (int x = threadIdx.x; x < ncol; x += blockDim.x) {
        maxval = max(maxval, input_a[x]);
    }

    // Parallel reduction to find maxval per row
    __shared__ float shared_maxval;
    if (threadIdx.x == 0) shared_maxval = -FLT_MAX;
    __syncthreads();

    atomicMax(&shared_maxval, maxval);
    __syncthreads();

    float sum = 0;
    for (int x = threadIdx.x; x < ncol; x += blockDim.x) {
        sum += exp(input_a[x] - shared_maxval);
    }

    // Parallel reduction to compute sum per row
    __shared__ float shared_sum;
    if (threadIdx.x == 0) shared_sum = 0;
    __syncthreads();

    atomicAdd(&shared_sum, sum);
    __syncthreads();

    float loss = 0;
    for (int x = threadIdx.x; x < ncol; x += blockDim.x) {
        loss -= input_b[x] * log(exp(input_a[x] - shared_maxval) / shared_sum);
    }

    atomicAdd(&loss_per_row[y], loss);
    __syncthreads();

    // Use parallel reduction for mean loss across rows
    __shared__ float shared_mean_loss;
    if (threadIdx.x == 0) shared_mean_loss = 0;
    __syncthreads();

    atomicAdd(&shared_mean_loss, loss_per_row[y]);
    __syncthreads();

    if (threadIdx.x == 0 && blockIdx.x == 0) {
        if (y == 0) {
            output[0] = shared_mean_loss / nrow;
        }
    }
}