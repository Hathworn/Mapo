#include "hip/hip_runtime.h"
#include "includes.h"

// This works fine with a mutex, but crashes with a sigbus error when not using a mutex
// #define USE_MUTEX

#ifdef USE_MUTEX
std::mutex m;
#endif


__global__ void testKernel() {
    // Optimized by introducing a sync point to ensure data consistency
    __syncthreads(); // Synchronize threads before printing
    printf("Thread Kernel running\n");
    __syncthreads(); // Synchronize threads after printing
}