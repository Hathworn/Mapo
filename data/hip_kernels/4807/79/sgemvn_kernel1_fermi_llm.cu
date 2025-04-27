#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sgemvn_kernel1_fermi(int n, int m, int n1, float alpha, float* A, int lda, float *x, float *y)
{
    int ind = blockIdx.x * blockDim.x + threadIdx.x; // Use blockDim.x for better readability

    if (ind >= n) return; // Early exit if index is out of bounds

    A += ind;
    float res = 0.f;
    
    int i = 0;
    for (; i < n1; i += sgemv_bs) {
        #pragma unroll
        for (int j = 0; j < sgemv_bs; j++) {
            res += A[0] * x[j];
            A += lda;
        }
        x += sgemv_bs;
    }

    // Remove the disabled code section to reduce clutter

    y[ind] = alpha * res; // Direct assignment
}