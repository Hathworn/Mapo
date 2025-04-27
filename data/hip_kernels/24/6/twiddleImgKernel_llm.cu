#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void twiddleImgKernel(float *wi, float *w, int N)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory to optimize access
    extern __shared__ float shared_w[];

    if (idx < N) {
        // Preload w array into shared memory
        if (threadIdx.x < N) {
            shared_w[threadIdx.x] = w[threadIdx.x * 2 + 1];
        }
        __syncthreads();

        if (idx == 0) {
            for (int i = 0; i < N; i++)
                wi[idx * N + i] = 0;
        } else {
            wi[idx * N + 0] = 0;
            for (int i = 1; i < N; i++) {
                int index = (idx * i) % N;
                wi[idx * N + i] = shared_w[index];
            }
        }
    }
}