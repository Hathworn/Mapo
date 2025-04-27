#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gaussjordan(double *A, double *I, int n, int i)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure indices are within bounds
    if (x < n && y < n) {
        // Use shared memory to reduce global memory access 
        __shared__ double shared_A_i[1024]; // or adjust size to fit n per block constraints
        __shared__ double shared_I_i[1024];

        // Load a row of A and I to shared memory once
        if (y == 0) {
            shared_A_i[threadIdx.x] = A[i * n + x];
            shared_I_i[threadIdx.x] = I[i * n + x];
        }
        __syncthreads();

        if (x != i) {
            I[x * n + y] -= shared_I_i[threadIdx.x] * A[x * n + i];
            if (y != i) {
                A[x * n + y] -= shared_A_i[threadIdx.x] * A[x * n + i];
            }
        }
    }
}