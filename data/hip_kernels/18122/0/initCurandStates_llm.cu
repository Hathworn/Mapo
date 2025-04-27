#include "hip/hip_runtime.h"
#include "includes.h"

/*
* File smc_kernels.cu contains definitions of kernels used by SMC.
*/

// Check if using NVCC
#ifdef __NVCC__
#endif

// Kernel to initialize CURAND states
__global__ void initCurandStates(hiprandState* randStates, int numThreads, int seed) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= numThreads) return;

    // Use local variable to optimize memory access and avoid unnecessary global accesses
    hiprandState localRandState;
    hiprand_init(1234 + clock64(), seed * numThreads + i, 0, &localRandState);
    randStates[i] = localRandState;
}