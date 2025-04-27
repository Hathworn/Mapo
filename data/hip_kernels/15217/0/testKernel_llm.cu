#include "hip/hip_runtime.h"
#include "includes.h"

// This works fine with a mutex, but crashes with a sigbus error when not using a mutex
// #define USE_MUTEX

#ifdef USE_MUTEX
std::mutex m;
#endif

__global__ void testKernel() {
    // Optimize by ensuring printf doesn't rely on synchronization
    unsigned int tid = blockIdx.x * blockDim.x + threadIdx.x;
    printf("Thread %u: Kernel running\n", tid);
}