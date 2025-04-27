#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrix_multiply_kernel(double *matrix, double *vector_in, double *vector_out, long dim_mn) {
    // Load the thread index and calculate the row index for this thread
    long i = threadIdx.x + blockIdx.x * blockDim.x;

    if (i < dim_mn) {
        double out = 0.0;

        // Use shared memory to cache the vector_in for all threads in the block
        extern __shared__ double shared_vector_in[];

        if (threadIdx.x < dim_mn) {
            shared_vector_in[threadIdx.x] = vector_in[threadIdx.x];
        }
        __syncthreads();

        for (long j = 0; j < dim_mn; j++) {
            // Access shared memory instead of global memory for vector_in
            out += matrix[i * dim_mn + j] * shared_vector_in[j];
        }

        vector_out[i] = out;
    }
}