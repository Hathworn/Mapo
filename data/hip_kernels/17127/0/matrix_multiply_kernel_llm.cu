#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void matrix_multiply_kernel(double *matrix, double *vector_in, double *vector_out, long dim_mn){
    long i = threadIdx.x + blockIdx.x * blockDim.x;
    if (i < dim_mn) {
        double out = 0.0;
        #pragma unroll // Unroll loop for better performance
        for (long j = 0; j < dim_mn; j++) {
            out += matrix[i * dim_mn + j] * vector_in[j];
        }
        vector_out[i] = out;
    }
}