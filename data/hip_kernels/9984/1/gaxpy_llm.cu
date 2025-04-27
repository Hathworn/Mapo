#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gaxpy(double *y, double *a, double *x, int m, int n) {
    int bid = blockIdx.x;
    int tid = threadIdx.x;
    double sum = 0.0;  // Accumulator for partial sums

    if (bid < m) {
        for (int i = tid; i < n; i += blockDim.x) {
            sum += a[bid * n + i] * x[i];  // Accumulate products
        }
        // Use atomic operation to sum partial results
        atomicAdd(&y[bid], sum);
    }
}