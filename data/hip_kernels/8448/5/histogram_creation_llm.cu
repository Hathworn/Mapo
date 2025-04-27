#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __host__ void print(float *result)
{
    for(int k = 0; k < 3; k++)
    {
        for(int i = 0; i < N; i++)
        {
            for(int j = 0; j < N; j++)
                printf("%f ",result[(i*N + j)*3 + k]);
            printf("\n");
        }
        printf("\n");
    }
}

__global__ void histogram_creation(int *A, int *hist, int no_of_threads) {
    // Calculate global index
    int global_x = blockDim.x * blockIdx.x + threadIdx.x;
    // Declare shared memory for local histogram
    __shared__ int local_hist[N+1];

    // Initialize local histogram using block-wide sync
    for(int i = threadIdx.x; i <= N; i += blockDim.x) {
        local_hist[i] = 0;
    }
    __syncthreads();

    // Populate local histogram using atomic adds
    for(int i = global_x; i < M; i += blockDim.x * gridDim.x) {
        atomicAdd(&local_hist[A[i]], 1);
    }
    __syncthreads();

    // Update global histogram using atomic adds
    for(int i = threadIdx.x; i <= N; i += blockDim.x) {
        atomicAdd(&hist[i], local_hist[i]);
    }
}