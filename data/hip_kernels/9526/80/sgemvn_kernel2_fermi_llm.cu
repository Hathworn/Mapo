#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sgemvn_kernel2_fermi(int n, int m, int n1, float alpha, float* A, int lda, float *x, float *y) {
    int ind = blockIdx.x * num_threads + threadIdx.x;

    A += ind;
    x += threadIdx.x;

    float res = 0.f;

    __shared__ float buff[num_threads];
    for (int i = 0; i < n1; i += num_threads) {
        // Load elements into shared memory
        __syncthreads();
        buff[threadIdx.x] = x[i];
        __syncthreads();

        // Compute results
        #pragma unroll
        for (int j = 0; j < num_threads; j++) {
            res += A[0] * buff[j];
            A += lda;
        }
    }

    // Final result storage
    if (ind < n) {
        y[ind] = alpha * res;
    }
}
```
