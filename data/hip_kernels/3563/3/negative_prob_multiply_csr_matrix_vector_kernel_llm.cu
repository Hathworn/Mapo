#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void negative_prob_multiply_csr_matrix_vector_kernel(unsigned int* cum_row_indexes, unsigned int* column_indexes, float* matrix_data, float* in_vector, float* out_vector, unsigned int outerdim) {

    unsigned int row = blockDim.x * blockIdx.x + threadIdx.x;

    if (row < outerdim) {
        float prob = 1.0;

        unsigned int row_start = cum_row_indexes[row];
        unsigned int row_end = cum_row_indexes[row+1];

        // Use shared memory for intermediate computations
        extern __shared__ float shared_probs[];
        
        unsigned int local_index = threadIdx.x;
        shared_probs[local_index] = 1.0;

        // Unroll loop for better performance
        for (int i = row_start; i < row_end; i++) {
            shared_probs[local_index] *= 1.0 - (matrix_data[i] * in_vector[column_indexes[i]]);
        }
        
        // Update global memory with computed value
        out_vector[row] = shared_probs[local_index];
    }
}