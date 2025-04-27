```c
#include "hip/hip_runtime.h"
#include "includes.h"

/*
* File smc_kernels.cu contains definitions of kernels used by SMC.
*/

#ifdef __NVCC__




#endif

__global__ void initCurandStates(hiprandState* randStates, int numThreads, int seed) {
    // Use grid-stride loop for better scalability and efficiency
    for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < numThreads; i += blockDim.x * gridDim.x) {
        // Directly initialize local state variable
        hiprandState randStateLocal;
        hiprand_init(1234 + clock64(), seed * numThreads + i, 0, &randStateLocal);
        randStates[i] = randStateLocal;
    }
}