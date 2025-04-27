#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void negative_prob_multiply_dense_matrix_vector_kernel(float* matrix, float* in_vector, float* out_vector, unsigned int outerdim, unsigned int innerdim) {
    // Optimized by pre-computing thread index and reducing divergence
    unsigned int row = blockIdx.x * blockDim.x + threadIdx.x;

    if (row < outerdim) {
        float prob = 1.0; // Move declaration inside to avoid unnecessary computation
        unsigned int row_offset = row * innerdim; // Pre-compute row offset

        for (int i = 0; i < innerdim; i++) {
            prob *= 1.0 - (matrix[row_offset + i] * in_vector[i]);
        }
        out_vector[row] = prob; // Store result
    }
}