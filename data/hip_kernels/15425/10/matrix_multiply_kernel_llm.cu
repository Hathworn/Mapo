#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrix_multiply_kernel(double *matrix, double *vector_in, double *vector_out, long dim_mn) {
    // Use shared memory for input vector to reduce global memory accesses
    extern __shared__ double shared_vector_in[];
    
    // Load vector_in into shared memory
    if (threadIdx.x < dim_mn) {
        shared_vector_in[threadIdx.x] = vector_in[threadIdx.x];
    }
    __syncthreads(); // Ensure all threads have loaded their part of vector_in

    double out = 0.0;
    long i = threadIdx.x + blockIdx.x * blockDim.x;
    
    if (i < dim_mn) {
        // Unroll loop for performance
        #pragma unroll
        for (long j = 0; j < dim_mn; j++) {
            out += matrix[i * dim_mn + j] * shared_vector_in[j];
        }
        vector_out[i] = out;
    }
}