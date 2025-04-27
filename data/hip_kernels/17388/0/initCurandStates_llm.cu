#include "hip/hip_runtime.h"
#include "includes.h"

/*
* File smc_kernels.cu contains definitions of kernels used by SMC.
*/

#ifdef __NVCC__




#endif
__global__ void initCurandStates(hiprandState* randStates, int numThreads, int seed) {
    // Efficiently calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Early exit if index is out of bounds
    if (i >= numThreads) return;
    
    // Initialize local state for better performance
    hiprandState randStateLocal;
    hiprand_init(1234 + clock64(), seed * numThreads + i, 0, &randStateLocal);
    
    // Store the local state back to global memory
    randStates[i] = randStateLocal;
}