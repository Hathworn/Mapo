#include "hip/hip_runtime.h"
#include "includes.h"

#define THREADS 256
#define BLOCKS 32
#define NUM THREADS*BLOCKS

int seed_var = 1239;

__device__ void swap(int *xp, int *yp)
{
    int temp = *xp;
    *xp = *yp;
    *yp = temp;
}

__global__ void bitonic_sort_step(int *d_pr, int *d_bt, int j, int k)
{
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    int ixj = i ^ j;

    // Optimize: Use shared memory for better performance
    __shared__ int shared_d_pr[THREADS];
    __shared__ int shared_d_bt[THREADS];
    
    // Load data into shared memory
    shared_d_pr[threadIdx.x] = d_pr[i];
    shared_d_bt[threadIdx.x] = d_bt[i];
    __syncthreads();

    // Perform sorting using shared memory
    if (ixj > i)
    {
        if ((i & k) == 0)
        {
            if (shared_d_pr[threadIdx.x] > shared_d_pr[ixj % THREADS])
            {
                // Swap in shared memory
                swap(&shared_d_pr[threadIdx.x], &shared_d_pr[ixj % THREADS]);
                swap(&shared_d_bt[threadIdx.x], &shared_d_bt[ixj % THREADS]);
            }
        }
        else
        {
            if (shared_d_pr[threadIdx.x] < shared_d_pr[ixj % THREADS])
            {
                // Swap in shared memory
                swap(&shared_d_pr[threadIdx.x], &shared_d_pr[ixj % THREADS]);
                swap(&shared_d_bt[threadIdx.x], &shared_d_bt[ixj % THREADS]);
            }
        }
    }
    __syncthreads();

    // Store results back to global memory
    d_pr[i] = shared_d_pr[threadIdx.x];
    d_bt[i] = shared_d_bt[threadIdx.x];
}