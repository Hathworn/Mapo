#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void matrix_multiply_kernel(double *matrix, double *vector_in, double *vector_out, long dim_mn) {
    // Calculate the global thread index
    long i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure thread is within bounds
    if (i < dim_mn) {
        double out = 0.0;
        // Use shared memory for vector_in to reduce global memory access
        extern __shared__ double shared_vector[];
        
        // Load vector_in to shared memory
        if (threadIdx.x < dim_mn) {
            shared_vector[threadIdx.x] = vector_in[threadIdx.x];
        }
        __syncthreads();  // Synchronize threads in block to ensure complete loading
        
        // Perform matrix-vector multiplication
        for (long j = 0; j < dim_mn; j++) {
            out += matrix[i * dim_mn + j] * shared_vector[j];
        }
        
        // Write result to the output vector
        vector_out[i] = out;
    }
}