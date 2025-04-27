#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrix_multiply_kernel(double *matrix, double *vector_in, double *vector_out, long dim_mn) {
    double out = 0.0;
    long i = threadIdx.x + blockIdx.x * blockDim.x;
    if (i < dim_mn) {
        // Use shared memory to optimize global memory access
        extern __shared__ double shared_vector[];
        if (threadIdx.x < dim_mn) {
            shared_vector[threadIdx.x] = vector_in[threadIdx.x];
        }
        __syncthreads();

        // Unroll the loop to improve performance
        for (long j = 0; j < dim_mn; j += 4) {
            out += (j < dim_mn ? matrix[i * dim_mn + j] * shared_vector[j] : 0)
                 + (j + 1 < dim_mn ? matrix[i * dim_mn + j + 1] * shared_vector[j + 1] : 0)
                 + (j + 2 < dim_mn ? matrix[i * dim_mn + j + 2] * shared_vector[j + 2] : 0)
                 + (j + 3 < dim_mn ? matrix[i * dim_mn + j + 3] * shared_vector[j + 3] : 0);
        }

        vector_out[i] = out;
    }
}