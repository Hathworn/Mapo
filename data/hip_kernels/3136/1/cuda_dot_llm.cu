#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cuda_dot(int N, double *a, double *b, double *c)
{
    extern __shared__ double localDot[];
    int ix = threadIdx.x + blockIdx.x * blockDim.x;
    int localIndex = threadIdx.x;
    
    double localSum = 0;
    for (int i = ix; i < N; i += blockDim.x * gridDim.x) {
        localSum += a[i] * b[i];  // Accumulate dot product contribution
    }

    localDot[localIndex] = localSum;
    __syncthreads();

    for (int offset = blockDim.x / 2; offset > 0; offset /= 2) {
        if (localIndex < offset) {
            localDot[localIndex] += localDot[localIndex + offset];  // Reduce within block
        }
        __syncthreads();
    }

    if (localIndex == 0) {
        c[blockIdx.x] = localDot[0];  // Store result from block into the output array
    }
}