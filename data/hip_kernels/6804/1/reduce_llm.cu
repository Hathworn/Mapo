#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduce(double *a, double *z, int sizeOut) {
    int tid = blockDim.x * blockIdx.x + threadIdx.x;
    if (tid > N / 2) return;

    extern __shared__ double subTotals[];
    // Use shared memory for reduction, double the values per thread
    subTotals[threadIdx.x] = (a[tid * 2] + a[tid * 2 + 1]) / 2.0;
    __syncthreads();

    // Optimize reduction using binary tree approach
    for (int stride = 1; stride < blockDim.x; stride *= 2) {
        if (threadIdx.x % (2 * stride) == 0) {
            subTotals[threadIdx.x] += subTotals[threadIdx.x + stride];
            subTotals[threadIdx.x] /= 2.0;
        }
        __syncthreads();
    }

    // Store the result in output array
    if (threadIdx.x == 0) {
        z[blockIdx.x] = subTotals[0];
    }
}
```
