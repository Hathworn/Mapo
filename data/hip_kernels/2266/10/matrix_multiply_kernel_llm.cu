#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrix_multiply_kernel(double *matrix, double *vector_in, double *vector_out, long dim_mn) {
    // Use shared memory for vector_in to reduce global memory access
    __shared__ double shared_vector_in[1024]; // Assumed max blockDim.x of 1024, adjust if necessary

    long i = threadIdx.x + blockIdx.x * blockDim.x;
    if (i < dim_mn) {
        double out = 0.0;
        
        // Load vector_in elements into shared memory
        if (threadIdx.x < dim_mn) {
            shared_vector_in[threadIdx.x] = vector_in[threadIdx.x];
        }
        __syncthreads(); // Ensure all data is loaded into shared memory
        
        for (long j = 0; j < dim_mn; j++) {
            out += matrix[i * dim_mn + j] * shared_vector_in[j];
        }
        
        vector_out[i] = out;
    }
}