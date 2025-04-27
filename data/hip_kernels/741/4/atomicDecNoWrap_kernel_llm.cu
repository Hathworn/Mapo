#include "hip/hip_runtime.h"
#include "includes.h"

#define VERBOSE 0
#define INTEGER_SCALE_FACTOR 100

// Command line argument definitions
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

// Lazy CUDA Error handling
__device__ unsigned int atomicDecNoWrap(unsigned int * address, unsigned int val) {
    unsigned int old = *address;
    unsigned int assumed;
    do {
        assumed = old;
        old = atomicCAS(address, assumed, (((assumed == 0) || (assumed > val)) ? assumed : (assumed - 1)));
    } while (assumed != old);
    return old;
}

__global__ void atomicDecNoWrap_kernel(unsigned int numIterations, unsigned int numInputs, float * d_probabilities, 
                                       unsigned int * d_quantity, unsigned int * d_count) {
    unsigned int tid = threadIdx.x + (blockDim.x * blockIdx.x);

    // Ensure thread is within range
    if (tid < numInputs) {
        // Print the initial quantity for first thread
        if (tid == 0) {
            printf("d_quantity[%u] = %u\n", tid, d_quantity[tid]);
        }

        // Loop through iterations
        for (int iteration = 0; iteration < numIterations; iteration++) {
            // Atomic decrement
            unsigned int old = atomicDecNoWrap(d_quantity + tid, MAX);

            // Print the old value for first thread on each iteration
            if (tid == 0) {
                printf("tid %u: iter %d, old %u\n", tid, iteration, old);
            }

            // If old is greater than 0, increment count
            if (old > 0) {
                atomicAdd(d_count + tid, 1); // Use atomicAdd for safe increments
            }
        }
    }
}