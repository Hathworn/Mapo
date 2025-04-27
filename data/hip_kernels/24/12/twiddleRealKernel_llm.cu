#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void twiddleRealKernel(float *wr, float *w, int N)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory for faster access
    extern __shared__ float shared_w[];

    // Load data into shared memory
    int threadIndex = threadIdx.x;
    for (int stride = threadIndex; stride < N; stride += blockDim.x) {
        shared_w[stride] = w[stride * 2];
    }
    __syncthreads();

    if (idx < N) {
        int baseIdx = idx * N;
        wr[baseIdx] = 1;
        for (int i = 1; i < N; i++) {
            int index = (idx * i) % N;
            wr[baseIdx + i] = (idx == 0) ? 1 : shared_w[index];
        }
    }
}