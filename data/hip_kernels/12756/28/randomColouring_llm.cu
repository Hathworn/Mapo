#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void randomColouring (hiprandState* globalState, int *degreeCount, int n, int limit) {
    // Calculate the global thread index
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Ensure we don't access out-of-bounds memory
    if (i < n) {
        // Read the state, generate a random number, and write back the state
        hiprandState localState = globalState[i];
        float RANDOM = hiprand_uniform(&localState) * (limit - 1 + 0.999999) + 1;
        globalState[i] = localState;

        // Convert float to int and store in degreeCount
        degreeCount[i] = (int)RANDOM;
    }
}
```
