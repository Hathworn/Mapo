#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"   // ensure function name to be exactly "eeTanh"
{
}

__global__ void swap_matrix_col(int N, int C, float *X, float *V)
{
    // Use shared memory to reduce global memory accesses
    extern __shared__ float shared_data[];

    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int index = (C-1) * N + i;

    if (i < N)
    {
        // Load V[i] to shared memory
        shared_data[threadIdx.x] = V[i];
        __syncthreads();

        float a = X[index];

        // Use shared memory for improved access pattern
        X[index] = shared_data[threadIdx.x];
        V[i] = a;
    }
}