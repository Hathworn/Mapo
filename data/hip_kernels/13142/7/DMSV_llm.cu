```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void DMSV(float* M, float* V, float* R, int* addr, int N) {
    int bid = blockIdx.x;
    int tid = threadIdx.x;
    if (tid < N) {
        // Load V into shared memory
        __shared__ float Vs[2 * LENGTH];
        if (tid < LENGTH) {
            for (int i = tid; i < 2 * N; i += BLOCK_SIZE) {
                Vs[i] = V[i];
            }
        }
        __syncthreads();

        // Calculate number of columns to process
        int numCols = (*addr - (intptr_t)&V[0]) / 4;
        float psum = 0.0;

        // Use shared memory for reduction
        for (int i = 0; i <= numCols; i++) {
            int vid = (int)Vs[i + N];
            psum += M[N * vid + bid * BLOCK_SIZE + tid] * Vs[i];
        }
        R[bid * BLOCK_SIZE + tid] = psum;
    }
}