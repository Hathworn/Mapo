#include "hip/hip_runtime.h"
#include "includes.h"
#define N 15000

using namespace std;

// Optimized kernel function for matrix-vector multiplication
__global__ void MatrVectMul(int *d_c, int *d_a, int *d_b)
{
    // Shared memory for shared computation per block
    __shared__ int shared_b[N];
    
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    if (threadIdx.x < N) {
        shared_b[threadIdx.x] = d_b[threadIdx.x];
    }
    __syncthreads();

    if (i < N) {
        int sum = 0;

        // Loop unrolling technique for improved performance
        for (int k = 0; k < N; k += 4) {
            sum += d_a[i + k * N] * shared_b[k]
                 + d_a[i + (k + 1) * N] * shared_b[k + 1]
                 + d_a[i + (k + 2) * N] * shared_b[k + 2]
                 + d_a[i + (k + 3) * N] * shared_b[k + 3];
        }
        
        d_c[i] = sum;
    }
}