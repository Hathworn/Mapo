#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrix_multiply_kernel(double *matrix, double *vector_in, double *vector_out, long dim_mn) {
    // Use shared memory for vector_in to reduce global memory access
    extern __shared__ double shared_vector[];
    long i = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Load vector_in into shared memory
    if (threadIdx.x < dim_mn) {
        shared_vector[threadIdx.x] = vector_in[threadIdx.x];
    }
    __syncthreads();
    
    if (i < dim_mn) {
        double out = 0.0;
        for (long j = 0; j < dim_mn; j++) {
            out += matrix[i * dim_mn + j] * shared_vector[j];
        }
        vector_out[i] = out;
    }
}