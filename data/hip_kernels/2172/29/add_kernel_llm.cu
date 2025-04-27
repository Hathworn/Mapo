#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate the global index with a single line for better readability
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Use a loop to allow each thread to handle multiple elements, improving performance
    for (int index = i; index < N; index += stride) {
        X[index * INCX] += ALPHA;
    }
}