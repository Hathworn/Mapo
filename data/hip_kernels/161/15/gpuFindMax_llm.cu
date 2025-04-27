#include "hip/hip_runtime.h"
#include "includes.h"
#define NTHREADS 512

__global__ void gpuFindMax(int n, float * data, int threadWorkLoad, int * maxIndex)
{
    int start = threadWorkLoad * threadIdx.x;
    int end = start + threadWorkLoad;
    __shared__ int maxIndicies[NTHREADS];

    maxIndicies[threadIdx.x] = -1;

    if(start >= n) return;

    int localMaxIndex = start;
    for(int i = start + 1; i < end && i < n; i++) { // Loop condition combined to improve readability
        if(data[i] > data[localMaxIndex])
            localMaxIndex = i;
    }
    maxIndicies[threadIdx.x] = localMaxIndex;
    __syncthreads();

    for(int i = blockDim.x / 2; i > 0; i /= 2) { // Use division for better clarity
        if(threadIdx.x < i) {
            int j = maxIndicies[threadIdx.x];
            int k = maxIndicies[i + threadIdx.x];
            if((k != -1) && (data[j] < data[k])) // Simplified condition check
                maxIndicies[threadIdx.x] = k;
        }
        __syncthreads();
    }
    if(threadIdx.x == 0) {
        *maxIndex = maxIndicies[0];
        // debug printing
        // printf("max index: %d\n", *maxIndex);
        // printf("max norm: %f\n", data[*maxIndex]);
        // end debug printing
    }
}