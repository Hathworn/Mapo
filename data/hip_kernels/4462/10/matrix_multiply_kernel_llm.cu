#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrix_multiply_kernel(double *matrix, double *vector_in, double *vector_out, long dim_mn) {
    // Pre-compute indices and check bounds
    long i = threadIdx.x + blockIdx.x * blockDim.x;

    if (i < dim_mn) {
        double out = 0.0;

        // Use shared memory to minimize access latency
        __shared__ double local_vector_in[1024];
        
        long threadIdx_x = threadIdx.x;
        
        // Load vector_in to shared memory
        if (threadIdx_x < dim_mn) {
            local_vector_in[threadIdx_x] = vector_in[threadIdx_x];
        }
        __syncthreads();
        
        // Reduced access into vector_in by using local_vector_in
        for (long j = 0; j < dim_mn; j++) {
            out += matrix[i * dim_mn + j] * local_vector_in[j];
        }

        vector_out[i] = out;
    }
}