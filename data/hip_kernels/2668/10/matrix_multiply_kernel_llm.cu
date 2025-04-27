#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrix_multiply_kernel(double *matrix, double *vector_in, double *vector_out, long dim_mn) {
    // Use shared memory for vector_in to reduce global memory access
    __shared__ double shared_vector[1024]; // Assumes max threads per block is 1024
    long i = threadIdx.x + blockIdx.x * blockDim.x;
    long tid = threadIdx.x;
    
    if (tid < dim_mn) {
        shared_vector[tid] = vector_in[tid];
    }
    
    __syncthreads(); // Ensure shared_vector is fully loaded before proceeding
    
    if (i < dim_mn) {
        double out = 0.0;
        for (long j = 0; j < dim_mn; j++) {
            out += matrix[i * dim_mn + j] * shared_vector[j];
        }
        vector_out[i] = out;
    }
}