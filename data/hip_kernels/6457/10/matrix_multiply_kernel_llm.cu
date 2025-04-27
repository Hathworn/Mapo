#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrix_multiply_kernel(double *matrix, double *vector_in, double *vector_out, long dim_mn) {
    // Cache vector_in into shared memory for faster access
    extern __shared__ double shared_vector_in[];
    long i = threadIdx.x + blockIdx.x * blockDim.x;
    if (threadIdx.x < dim_mn) {
        shared_vector_in[threadIdx.x] = vector_in[threadIdx.x];
    }
    __syncthreads(); // Ensure all threads have loaded vector_in into shared memory

    // Perform matrix-vector multiplication
    double out = 0.0;
    if (i < dim_mn) {
        for (long j = 0; j < dim_mn; j++) {
            out += matrix[i * dim_mn + j] * shared_vector_in[j];
        }
        vector_out[i] = out;
    }
}