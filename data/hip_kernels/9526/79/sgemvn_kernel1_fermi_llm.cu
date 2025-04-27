```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sgemvn_kernel1_fermi(int n, int m, int n1, float alpha, float* A, int lda, float *x, float *y)
{
    const int ind = blockIdx.x * num_threads + threadIdx.x;

    // Check index before accessing memory
    if (ind < n) {
        A += ind;
        float res = 0.f;

        for(int i = 0; i < n1; i += sgemv_bs) {
            #pragma unroll
            for(int j = 0; j < sgemv_bs; j++) {
                res += A[0] * x[j];
                A += lda;
            }
            x += sgemv_bs;
        }
        
        // Write result only if within bounds
        y[ind] = alpha * res;
    }
}