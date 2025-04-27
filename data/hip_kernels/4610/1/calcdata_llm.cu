#include "hip/hip_runtime.h"
#include "includes.h"

#define FLOAT_N 3214212.01

__global__ void calcdata(double* d_data, double* d_mean, int M, int N)
{
    // Calculate global index
    int i = blockDim.x * blockIdx.x + threadIdx.x + 1;
    if (i <= N) {  // Limit check to N
        // Use shared memory to optimize memory access
        extern __shared__ double shared_mean[];
        if (threadIdx.x < M) {
            shared_mean[threadIdx.x + 1] = d_mean[threadIdx.x + 1];
        }
        __syncthreads();
        for (int j = 1; j <= M; j++) {
            d_data[i * (M + 1) + j] -= shared_mean[j];
        }
    }
}