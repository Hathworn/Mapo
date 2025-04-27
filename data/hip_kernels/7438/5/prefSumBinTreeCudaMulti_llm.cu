#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void prefSumBinTreeCudaMulti(float *a, int n) {
    __shared__ float shm[CUDA_THREAD_NUM];
    int tid = threadIdx.x;
    int bid = blockIdx.x;
    int offset = CUDA_THREAD_NUM * bid;
    
    // Load data into shared memory
    shm[tid] = a[offset + tid];
    __syncthreads();
    
    // Binary tree reduction
    for (int stride = 1; stride <= n; stride *= 2) {
        if ((tid + 1) % (2 * stride) == 0) {
            shm[tid] += shm[tid - stride];
        }
        __syncthreads();
    }
    
    // Down-sweep phase
    for (int stride = n / 2; stride > 0; stride /= 2) {
        if ((tid + 1) % (2 * stride) == 0) {
            shm[tid] = shm[tid] + shm[tid - stride];
        }
        __syncthreads();
    }
    
    // Write results back to global memory
    a[offset + tid] = shm[tid];
}