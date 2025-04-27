#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void twiddleImgKernelIDFT(float *wi, float *w, int N)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int i, index;

    // Use shared memory to reduce global memory access
    __shared__ float shared_w[];

    if (idx < N) {
        if (idx == 0) {
            for (i = 0; i < N; i++) {
                wi[i] = 0; // Pointer indexing to simplify index calculation
            }
        } else {
            wi[idx * N] = 0;
            for (i = 1; i < N; i++) {
                index = (idx * i) % N;

                // Load w into shared memory for faster access
                if (threadIdx.x == 0) {
                    shared_w[i] = w[index * 2 + 1];
                }
                __syncthreads(); // Ensure all threads have loaded w

                // Use shared memory for computation
                wi[idx * N + i] = shared_w[i];
            }
        }
    }
}