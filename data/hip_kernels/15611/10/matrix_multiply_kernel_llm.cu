#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrix_multiply_kernel(double *matrix, double *vector_in, double *vector_out, long dim_mn) {
    // Cache input vector in shared memory for faster access
    extern __shared__ double shared_vector[];
    long i = threadIdx.x + blockIdx.x * blockDim.x;
    if (threadIdx.x < dim_mn) {
        shared_vector[threadIdx.x] = vector_in[threadIdx.x];
    }
    __syncthreads(); // Ensure shared memory is fully populated
    
    if (i < dim_mn) {
        double out = 0.0;
        // Access shared memory instead of global memory for vector_in
        for (long j = 0; j < dim_mn; j++) {
            out += matrix[i * dim_mn + j] * shared_vector[j];
        }
        vector_out[i] = out;
    }
}