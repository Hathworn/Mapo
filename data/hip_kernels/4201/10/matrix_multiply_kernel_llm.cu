#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrix_multiply_kernel(double *matrix, double *vector_in, double *vector_out, long dim_mn) {
    // Get the index for the current thread
    long i = threadIdx.x + blockIdx.x * blockDim.x;

    if (i < dim_mn) {
        double out = 0.0;
        
        // Use shared memory for input vector to optimize memory access
        extern __shared__ double s_vector_in[];
        
        if (threadIdx.x < dim_mn) {
            s_vector_in[threadIdx.x] = vector_in[threadIdx.x];
        }
        __syncthreads(); // Ensure all threads have loaded data before proceeding

        // Perform matrix-vector multiplication
        for (long j = 0; j < dim_mn; j++) {
            out += matrix[i * dim_mn + j] * s_vector_in[j];
        }

        // Store result in output vector
        vector_out[i] = out;
    }
}