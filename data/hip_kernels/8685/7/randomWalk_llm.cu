#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void randomWalk(double *results, int T, int N) {
    extern __shared__ double sharedResults[]; // Use shared memory for results
    int threadId = threadIdx.x;
    int blockSize = blockDim.x;
    int i, start = threadId;

    hiprandState_t state;
    hiprand_init(1234, threadId, 0, &state); // Use thread-specific state
    double random;

    if (start == 0) {
        sharedResults[0] = 0.0;
    }
    __syncthreads(); // Ensure initial value is set

    for (i = start + 1; i < N; i += blockSize) {
        random = hiprand_normal_double(&state);
        if (i < N) { // Ensure not out of bounds
            sharedResults[i] = (i == 1) ? random * sqrt((double) T / N) 
                                        : sharedResults[i - 1] + random * sqrt((double) T / N);
        }
    }

    __syncthreads(); // Allow all threads to complete writing to shared memory

    if (start < N) {
        results[start] = sharedResults[start]; // Copy from shared memory to global memory
    }
}