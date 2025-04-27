```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void prefSumBinTreeCuda(float *a, int n) {
    __shared__ float shm[CUDA_THREAD_NUM];
    int tid = threadIdx.x;
    int dot = 2; // Initial depth of tree

    // Load data into shared memory with stride of dot
    if ((tid + 1) % dot == 0) {
        shm[tid] = a[tid] + a[tid - 1];
    }
    dot *= 2;
    __syncthreads();

    // Compute prefix sum using a binary tree approach
    while (dot <= n) {
        if ((tid + 1) % dot == 0) {
            shm[tid] = shm[tid] + shm[tid - dot / 2];
        }
        dot *= 2;
        __syncthreads();
    }

    // Propagate back results to shared memory
    dot /= 2;
    while (dot > 2) {
        if ((tid + 1) % dot == 0) {
            if ((tid + 1) / dot != 1) {
                shm[tid - dot / 2] += shm[tid - dot];
            }
        }
        dot /= 2;
        __syncthreads();
    }

    // Write results back to array a
    if ((tid + 1) % 2 == 0) {
        a[tid] = shm[tid];
    } else if (tid > 0) {
        a[tid] += shm[tid - 1];
    }
}