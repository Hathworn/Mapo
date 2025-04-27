#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrix_multiply_kernel(double *matrix, double *vector_in, double *vector_out, long dim_mn){
    extern __shared__ double s_vector_in[]; // Use shared memory for vector
    long i = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Load vector elements into shared memory
    long j = threadIdx.x;
    if (j < dim_mn) {
        s_vector_in[j] = vector_in[j];
    }
    __syncthreads(); // Ensure all data is loaded

    if (i < dim_mn) {
        double out = 0.0;
        // Use shared memory for input vector and do computation
        for (j = 0; j < dim_mn; j++) {
            out += matrix[i * dim_mn + j] * s_vector_in[j];
        }
        vector_out[i] = out;
    }
}