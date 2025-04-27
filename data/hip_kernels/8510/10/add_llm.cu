#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void add(int n, long *a, long *b, long *sum)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Use warp reduction for smaller number of threads
    for (int stride = 1; stride < n; stride *= 2) {
        if (i % stride == 0 && i + stride < n) {
            a[i] += a[i + stride];
        }
        __syncthreads();
    }
    if (i < n) {
        sum[i] = a[i] + b[i];
        // Consider reducing or eliminating printf for efficiency
        printf("CUDA KERNEL ADD %ld + %ld = %ld \n", a[i], b[i], sum[i]);
    }
}