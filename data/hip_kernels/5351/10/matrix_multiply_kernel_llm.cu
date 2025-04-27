#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize for memory access and computation efficiency
__global__ void matrix_multiply_kernel(double *matrix, double *vector_in, double *vector_out, long dim_mn) {
    // Use shared memory for the input vector to reduce global memory access
    extern __shared__ double shared_vector[];
    
    long i = threadIdx.x + blockIdx.x * blockDim.x;
    if (i < dim_mn) {
        double out = 0.;
        
        // Copy the input vector to shared memory
        if (threadIdx.x < dim_mn) {
            shared_vector[threadIdx.x] = vector_in[threadIdx.x];
        }
        __syncthreads(); // Ensure all threads have loaded the vector
        
        // Perform the matrix-vector multiplication with shared memory access
        for (long j = 0; j < dim_mn; j++) {
            out += matrix[i * dim_mn + j] * shared_vector[j];
        }
        
        vector_out[i] = out;
    }
}