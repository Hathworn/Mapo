#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrix_multiply_kernel(double *matrix, double *vector_in, double *vector_out, long dim_mn) {
    // Cache input vector in shared memory for faster access
    __shared__ double shared_vector_in[blockDim.x];
    
    long i = threadIdx.x + blockIdx.x * blockDim.x;
    double out = 0.0;

    for (long j = threadIdx.x; j < dim_mn; j += blockDim.x) {
        shared_vector_in[threadIdx.x] = vector_in[j];
        __syncthreads(); // Synchronize to make sure all threads have loaded the data

        if (i < dim_mn) {
            for (long k = 0; k < blockDim.x && (j + k) < dim_mn; ++k) {
                out += matrix[i * dim_mn + j + k] * shared_vector_in[k];
            }
        }
        __syncthreads(); // Synchronize before next iteration
    }

    if (i < dim_mn) {
        vector_out[i] = out;
    }
}