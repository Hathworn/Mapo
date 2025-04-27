#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrix_multiply_kernel(double *matrix, double *vector_in, double *vector_out, long dim_mn) {
    // Cache thread's index and reduce redundant calculations
    long i = threadIdx.x + blockIdx.x * blockDim.x;

    // Ensure work is done only for valid threads
    if (i < dim_mn) {
        double out = 0.0;  // Use optimized initialization
        // Loop unrolling could be applied for better performance but is skipped for simplicity
        for (long j = 0; j < dim_mn; j++) {
            out += matrix[i * dim_mn + j] * vector_in[j];
        }
        vector_out[i] = out;
    }
}