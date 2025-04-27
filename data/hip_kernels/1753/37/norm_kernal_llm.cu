#include "hip/hip_runtime.h"
#include "includes.h"

#define MAX_THREADS 256

__global__ void norm_kernal(float * data, float mean, float var, int totaltc)
{
    // Use shared memory to read input data if possible
    __shared__ float sharedData[MAX_THREADS];
    const uint index = threadIdx.x + (blockIdx.x + gridDim.x*blockIdx.y)*MAX_THREADS;

    // Check bounds to prevent overwriting out-of-bound memory
    if(index < totaltc)
    {
        // Load data into shared memory
        sharedData[threadIdx.x] = data[index];
        __syncthreads(); // Ensure all threads have completed the data load
        
        // Perform normalization using shared memory
        sharedData[threadIdx.x] = (sharedData[threadIdx.x] - mean) / var;
        
        // Write result back to global memory
        data[index] = sharedData[threadIdx.x];
    }
}