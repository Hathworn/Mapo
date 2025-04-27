#include "hip/hip_runtime.h"
#include "includes.h"


__global__ void matrix_multiply_kernel(double *matrix, double *vector_in, double *vector_out, long dim_mn){
    double out = 0.0;  // Initialize output to zero before loop
    long i = threadIdx.x + blockIdx.x * blockDim.x;  // Calculate global thread ID
    if (i < dim_mn) {
        #pragma unroll  // Encourage loop unrolling for better performance
        for (long j = 0; j < dim_mn; j++) {
            out += matrix[i * dim_mn + j] * vector_in[j];
        }
        vector_out[i] = out;  // Store result in output vector
    }
}