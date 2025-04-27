#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update_local_time(int *next, double *local_time, double GTIME) {
    unsigned int gtid = blockIdx.x * blockDim.x + threadIdx.x;

    // Use __syncthreads() to ensure all threads have updated 'who'
    __shared__ int shared_next[256];
    __shared__ double shared_local_time[256];

    // Load data into shared memory for coalesced reads
    shared_next[threadIdx.x] = next[gtid];
    __syncthreads();

    int who = shared_next[threadIdx.x];

    if (who < 0) return;

    // Avoid unnecessary global memory write
    shared_local_time[threadIdx.x] = GTIME;
    local_time[who] = shared_local_time[threadIdx.x];
}