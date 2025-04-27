#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrix_multiply_kernel(double *matrix, double *vector_in, double *vector_out, long dim_mn) {
    long i = threadIdx.x + blockIdx.x * blockDim.x;
    if (i < dim_mn) {
        double out = 0.0;
        // Unrolling the loop for better performance
        for (long j = 0; j < dim_mn; j+=4) {
            out += matrix[i * dim_mn + j] * vector_in[j];
            if (j+1 < dim_mn) out += matrix[i * dim_mn + j + 1] * vector_in[j + 1];
            if (j+2 < dim_mn) out += matrix[i * dim_mn + j + 2] * vector_in[j + 2];
            if (j+3 < dim_mn) out += matrix[i * dim_mn + j + 3] * vector_in[j + 3];
        }
        vector_out[i] = out;
    }
}