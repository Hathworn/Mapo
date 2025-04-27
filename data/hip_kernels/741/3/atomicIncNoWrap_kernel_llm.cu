#include "hip/hip_runtime.h"
#include "includes.h"

#define VERBOSE 0
#define INTEGER_SCALE_FACTOR 100

#define DEFAULT_NUM_REPEATS 1
#define DEFAULT_NUM_ITERATIONS 1
#define DEFAULT_NUM_ELEMENTS 128
#define DEFAULT_SEED 0
#define DEFAULT_DEVICE 0

#define MIN_ARGS 1
#define MAX_ARGS 6

#define ARG_EXECUTABLE 0
#define ARG_REPEATS 1
#define ARG_ITERATIONS 2
#define ARG_ELEMENTS 3
#define ARG_SEED 4
#define ARG_DEVICE 5

#define MAX 10

__device__ unsigned int atomicIncNoWrap(unsigned int *address, unsigned int val) {
    unsigned int old = *address;
    unsigned int assumed;
    do {
        assumed = old;
        old = atomicCAS(address, assumed, ((assumed >= val) ? assumed : (assumed + 1)));
    } while (assumed != old);
    return old;
}

__global__ void atomicIncNoWrap_kernel(unsigned int numIterations, unsigned int numInputs, float *d_probabilities, unsigned int *d_quantity, unsigned int *d_count) {
    unsigned int tid = threadIdx.x + (blockDim.x * blockIdx.x);

    // Use shared memory for d_count to reduce global memory accesses
    extern __shared__ unsigned int shared_count[];

    if (tid < numInputs) {
        if (tid == 0) {
            printf("d_quantity[%u] = %u\n", tid, d_quantity[tid]);
        }
        // Initialize shared memory
        shared_count[threadIdx.x] = 0;

        for (int iteration = 0; iteration < numIterations; iteration++) {
            unsigned int old = atomicIncNoWrap(d_quantity + tid, MAX);
            if (tid == 0) {
                printf("tid %u: iter %d, old %u\n", tid, iteration, old);
            }
            if (old < MAX) {
                // Increment shared memory counter
                shared_count[threadIdx.x]++;
            }
        }

        // Write shared memory result to global memory
        d_count[tid] += shared_count[threadIdx.x];
    }
}