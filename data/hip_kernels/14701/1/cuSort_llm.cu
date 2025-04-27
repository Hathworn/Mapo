#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuSort(float* data, int bucketSize, int* startPoint) 
{
    // Use shared memory for more efficient data access
    extern __shared__ float sharedData[];
    int L = blockIdx.x * bucketSize;
    int U = L + bucketSize;
    int tid = threadIdx.x;
    float tmp;
    startPoint[blockIdx.x] = L;

    // Load data into shared memory
    if (L + tid < U) {
        sharedData[tid] = data[L + tid];
    }
    __syncthreads();

    // Sort using insertion sort in shared memory
    for (int i = 1; i < bucketSize; i++) {
        tmp = sharedData[i];
        int j = i - 1;
        while (j >= 0 && sharedData[j] > tmp) {
            sharedData[j + 1] = sharedData[j];
            j--;
        }
        sharedData[j + 1] = tmp;
    }
    __syncthreads();

    // Write sorted data back to global memory
    if (L + tid < U) {
        data[L + tid] = sharedData[tid];
    }
}