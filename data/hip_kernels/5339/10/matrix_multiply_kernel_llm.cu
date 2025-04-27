#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrix_multiply_kernel(double *matrix, double *vector_in, double *vector_out, long dim_mn) {
    // Utilizing shared memory to optimize data access
    extern __shared__ double shared_vector_in[];
    long i = threadIdx.x + blockIdx.x * blockDim.x;
    double out = 0.0;

    if (threadIdx.x < dim_mn) {
        shared_vector_in[threadIdx.x] = vector_in[threadIdx.x];
    }
    __syncthreads();

    if (i < dim_mn) {
        for (long j = 0; j < dim_mn; j++) {
            out += matrix[i * dim_mn + j] * shared_vector_in[j];
        }
        vector_out[i] = out;
    }
}