#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Matrix_Product(double* A, double* g, double* C)
{
    // Use shared memory for 'g' to reduce global memory accesses
    extern __shared__ double g_shared[];
    
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int N = 1000;
    if (row >= N) return;
    
    double Cvalue = 0.0;
    int e = threadIdx.x;
    
    // Each block processes a portion of 'g'
    if (e < N) {
        g_shared[e] = g[e];
    }
    
    __syncthreads();
    
    // Compute the output value using shared memory
    for (int e = 0; e < N; e++) {
        Cvalue += A[N * row + e] * g_shared[e];
    }
    
    C[row] += Cvalue;
}