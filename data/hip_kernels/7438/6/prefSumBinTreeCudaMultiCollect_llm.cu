#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void prefSumBinTreeCudaMultiCollect(float *a, int n, int numBlocks) {
    __shared__ float shm[CUDA_THREAD_NUM];
    int tid = threadIdx.x;
    
    // Load data into shared memory
    shm[tid] = a[tid];
    __syncthreads();

    // Perform upsweep phase of the parallel prefix sum
    for (int stride = 1; stride <= n / 2; stride *= 2) {
        int index = (tid + 1) * stride * 2 - 1;
        if (index < n) {
            shm[index] += shm[index - stride];
        }
        __syncthreads();
    }

    // Clear the last element for downsweep phase
    if (tid == 0) {
        shm[n - 1] = 0;
    }
    __syncthreads();

    // Perform downsweep phase
    for (int stride = n / 2; stride > 0; stride /= 2) {
        int index = (tid + 1) * stride * 2 - 1;
        if (index < n) {
            float temp = shm[index - stride];
            shm[index - stride] = shm[index];
            shm[index] += temp;
        }
        __syncthreads();
    }

    // Write results back to global memory
    a[tid] = shm[tid];
}