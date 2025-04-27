#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subMat(float *a, float *b, float *sub, int N)
{
    int idx = threadIdx.x + blockIdx.x * blockDim.x;

    // Calculate total number of threads
    int numThreads = blockDim.x * gridDim.x;

    // Iterate over the elements assigned to this thread
    for (int i = idx; i < N * N; i += numThreads) {
        sub[i] = a[i] - b[i];
    }
}