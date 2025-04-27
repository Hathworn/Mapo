#include "hip/hip_runtime.h"
#include "includes.h"
#define rows 1000
#define cols 1000

// CUDA kernel. Each thread takes care of one element of c

__global__ void matricesMul(double *m1, double *m2, double *m3)
{
    // Use shared memory to optimize memory access
    __shared__ double shared_m1[32][32];
    __shared__ double shared_m2[32][32];

    // Calculate row and column index
    int ti = blockIdx.y * blockDim.y + threadIdx.y;
    int tj = blockIdx.x * blockDim.x + threadIdx.x;

    double data = 0.0;
    
    // Loop over sub-matrices
    for (int sub = 0; sub < (rows + 31) / 32; ++sub) {
        if (ti < rows && (sub * 32 + threadIdx.x) < cols) {
            shared_m1[threadIdx.y][threadIdx.x] = m1[ti * rows + sub * 32 + threadIdx.x];
        } else {
            shared_m1[threadIdx.y][threadIdx.x] = 0.0;
        }
        
        if ((sub * 32 + threadIdx.y) < rows && tj < cols) {
            shared_m2[threadIdx.y][threadIdx.x] = m2[(sub * 32 + threadIdx.y) * cols + tj];
        } else {
            shared_m2[threadIdx.y][threadIdx.x] = 0.0;
        }

        __syncthreads();

        // Multiply and accumulate
        for (int k = 0; k < 32; ++k) {
            data += shared_m1[threadIdx.y][k] * shared_m2[k][threadIdx.x];
        }

        __syncthreads();
    }

    // Ensure we do not go out of bounds before writing the result
    if (ti < rows && tj < cols) {
        m3[ti * rows + tj] = data;
    }
}