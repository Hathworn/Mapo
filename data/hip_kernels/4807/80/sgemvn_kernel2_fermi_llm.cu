#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sgemvn_kernel2_fermi(int n, int m, int n1, float alpha,  float* A, int lda, float *x, float *y)
{
    int ind = blockIdx.x * num_threads + threadIdx.x;

    A += ind;
    x += threadIdx.x;

    float res = 0.f;

    __shared__ float buff[num_threads];
    for(int i = 0; i < n1; i += num_threads) {
        // Load shared memory with x values
        if (threadIdx.x < num_threads && (i + threadIdx.x) < m) {
            buff[threadIdx.x] = x[i + threadIdx.x];
        }
        __syncthreads();

        #pragma unroll
        for(int j = 0; j < num_threads; j++) {
            res += A[0] * buff[j];
            A += lda;
        }
        __syncthreads();
    }
    
    // Final result for output y
    if (ind < n) {
        y[ind] = alpha * res;
    }
}