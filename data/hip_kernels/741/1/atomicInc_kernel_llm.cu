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

// Optimized CUDA Kernel
__global__ void atomicInc_kernel( unsigned int numIterations, unsigned int numInputs, float * d_probabilities, unsigned int * d_quantity, unsigned int * d_count ){
    unsigned int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if thread id is within the bounds
    if (tid >= numInputs) return;

    // Remove if checks, consolidate printf 
    printf("tid %u: d_quantity[%u] = %u\n", tid, tid, d_quantity[tid]);

    for (int iteration = 0; iteration < numIterations; iteration++){
        // Atomic increment with clamp
        unsigned int old = atomicInc(d_quantity + tid, MAX);

        // Increment count if old < MAX
        if (old < MAX) {
            d_count[tid]++;
        }
    }
}