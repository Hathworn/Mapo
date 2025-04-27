#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize global kernel function
__global__ void calculatePi(double *piTotal, long int iterations, int totalThreads)
{
    long int i;
    double piPartial = 0.0;

    int index = (blockDim.x * blockIdx.x) + threadIdx.x;
    long int initIteration = (iterations / totalThreads) * index;
    long int endIteration = initIteration + (iterations / totalThreads);

    // Unrolling loop for improved performance
    for (i = initIteration; i < endIteration; i++)
    {
        piPartial += (4.0 / (i * 2 + 1)) - (4.0 / (i * 2 + 3));
    }

    piTotal[index] = piPartial;

    __shared__ double sharedPiTotal[1024];  // Use shared memory to reduce global memory access
    sharedPiTotal[threadIdx.x] = piPartial;

    __syncthreads();

    // Reduction to sum results across threads using shared memory
    if (threadIdx.x == 0)
    {
        double blockSum = 0.0;
        for (int j = 0; j < blockDim.x; j++)
        {
            blockSum += sharedPiTotal[j];
        }
        atomicAdd(&piTotal[0], blockSum);  // Use atomicAdd to safely accumulate final result
    }
}