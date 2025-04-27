#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDot(const int nThreads, const float *m1, const float *m2, float *output, const int m1_rows, const int m1_columns, const int m2_columns) {
    // Use shared memory to reduce global memory accesses
    extern __shared__ float shared_m2[];
    int r = blockIdx.y * blockDim.y + threadIdx.y;
    int c = blockIdx.x * blockDim.x + threadIdx.x;

    if (r < m1_rows && c < m2_columns) {
        float t_output = 0.0f;
        for (int k = 0; k < m1_columns; ++k) {
            if (threadIdx.y == 0) {
                // Load m2 into shared memory
                shared_m2[threadIdx.x + k * blockDim.x] = m2[k * m2_columns + c];
            }
            __syncthreads(); // Synchronize to ensure shared memory is populated
            t_output += m1[r * m1_columns + k] * shared_m2[threadIdx.x + k * blockDim.x];
            __syncthreads(); // Synchronize threads before next iteration
        }
        output[r * m2_columns + c] = t_output;
    }
}