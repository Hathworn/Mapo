#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void spmv_csr_vector_kernel(unsigned int computation_restriction_factor, const unsigned int* cum_row_indexes, const unsigned int* column_indexes, const float* matrix_data , const float* in_vector, float* out_vector, const unsigned int outerdim) {
    __shared__ float vals[32];
    int thread_id = blockDim.x * blockIdx.x + threadIdx.x;
    int warp_id = thread_id / 32;
    int lane = thread_id & (32 - 1);

    int row = warp_id / computation_restriction_factor;
    if (row < outerdim) {
        int row_start = cum_row_indexes[row];
        int row_end = cum_row_indexes[row+1];
        
        // Initialize shared memory to 1 only for active lanes
        vals[threadIdx.x] = 1;
    
        for (int i = row_start + lane; i < row_end; i += 32) {
            vals[threadIdx.x] *= 1 - (matrix_data[i] * in_vector[column_indexes[i]]);
        }
        
        // Unroll reduction loops
        if (lane < 16) vals[threadIdx.x] *= vals[threadIdx.x + 16];
        if (lane < 8) vals[threadIdx.x] *= vals[threadIdx.x + 8];
        if (lane < 4) vals[threadIdx.x] *= vals[threadIdx.x + 4];
        if (lane < 2) vals[threadIdx.x] *= vals[threadIdx.x + 2];
        if (lane < 1) vals[threadIdx.x] *= vals[threadIdx.x + 1];

        // Store result from lane 0
        if (lane == 0) out_vector[row] = vals[threadIdx.x];
    }
}