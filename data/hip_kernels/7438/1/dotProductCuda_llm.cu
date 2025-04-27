#include "hip/hip_runtime.h"
#include "includes.h"
using namespace std;
#define CUDA_THREAD_NUM 1024
// must be a multiple of 2

void dotProductCPU();
__global__ void dotProductCuda(float *a, float *b, float *c) {
    __shared__ float se[CUDA_THREAD_NUM];

    // Calculate a.*b using the entire warp
    int tid = threadIdx.x + blockIdx.x * CUDA_THREAD_NUM;
    se[threadIdx.x] = a[tid] * b[tid];
    __syncthreads();

    // Improved Sum Reduction using warp shuffles
    for (unsigned int stride = warpSize / 2; stride > 0; stride /= 2) {
        if (threadIdx.x < stride) {
            se[threadIdx.x] += se[threadIdx.x + stride];
        }
        __syncthreads();
    }

    // Write block result to c
    if (threadIdx.x == 0) {
        c[blockIdx.x] = se[0];
    }
}