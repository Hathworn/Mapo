#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void big_add(int *a, int *b, int *c, unsigned int N) {
    // Improved loading of thread id and use const stride
    const unsigned int tid = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;
    
    for (unsigned int i = tid; i < N; i += stride) {
        c[i] = a[i] + b[i];
    }
}