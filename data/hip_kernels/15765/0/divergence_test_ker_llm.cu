#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void divergence_test_ker()
{
    // Use shared memory for reduced divergence
    __shared__ int tid_even[1024]; 
    __shared__ int tid_odd[1024];

    // Store thread index in appropriate array
    if (threadIdx.x % 2 == 0) {
        tid_even[threadIdx.x / 2] = threadIdx.x;
    } else {
        tid_odd[threadIdx.x / 2] = threadIdx.x;
    }

    __syncthreads(); // Synchronize before printing to avoid race conditions

    // Even thread printing
    if (threadIdx.x % 2 == 0) {
        printf("threadIdx.x %d : This is an even thread.\n", tid_even[threadIdx.x / 2]);
    }
    // Odd thread printing
    else {
        printf("threadIdx.x %d : This is an odd thread.\n", tid_odd[threadIdx.x / 2]);
    }
}