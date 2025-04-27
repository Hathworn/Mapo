#include "hip/hip_runtime.h"
#include "includes.h"
/**
* calculate pi
*/

// For the CUDA runtime routines (prefixed with "cuda_")

#define NUMTHREADS 10240
#define ITERATIONS 1e12

/**
* CUDA Kernel Device code
*
*/

/******************************************************************************
* Host main routine
*/
__global__ void calculatePi(double *piTotal, long int iterations, int totalThreads)
{
    long int i;
    double piPartial = 0.0;

    // Calculate global index
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Calculate initial and end iteration for each thread
    long int chunk_size = iterations / totalThreads;  // Divided chunk for each thread
    long int initialIteration = chunk_size * index;
    long int endIteration = initialIteration + chunk_size;

    // Calculate partial Pi
    for (i = initialIteration; i < endIteration; i += 2) {
        piPartial += (4.0 / (2 * i + 1)) - (4.0 / (2 * i + 3));
    }

    // Store partial result in global memory
    piTotal[index] = piPartial;

    // Ensure all threads have written their partial results
    __syncthreads();

    // Accumulate results in the first thread
    if (index == 0) {
        for (i = 1; i < totalThreads; i++) {
            piTotal[0] += piTotal[i];
        }
    }
}