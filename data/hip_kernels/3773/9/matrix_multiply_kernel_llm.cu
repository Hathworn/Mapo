#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrix_multiply_kernel(double *matrix, double *vector_in, double *vector_out, long dim_mn) {
    // Cache result variable in registers
    double out = 0.;
    long i = threadIdx.x + blockIdx.x * blockDim.x;

    // Calculate only if within bounds
    if (i < dim_mn) {
        // Use shared memory to reduce global memory access times
        __shared__ double shared_vector_in[1024];

        // Load data into shared memory
        if (threadIdx.x < dim_mn) {
            shared_vector_in[threadIdx.x] = vector_in[threadIdx.x];
        }
        __syncthreads();

        // Loop unrolling for better performance
        for (long j = 0; j < dim_mn; j += 4) {
            out += matrix[i * dim_mn + j] * shared_vector_in[j]
                 + matrix[i * dim_mn + (j + 1)] * shared_vector_in[j + 1]
                 + matrix[i * dim_mn + (j + 2)] * shared_vector_in[j + 2]
                 + matrix[i * dim_mn + (j + 3)] * shared_vector_in[j + 3];
        }
        
        // Write result back to global memory
        vector_out[i] = out;
    }
}