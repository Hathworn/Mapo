#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduce(float *a, int size, int c) {
    int tid = blockIdx.x; // Handle the data at the index
    int index = c;
    int base = (tid + index + 1) * size;

    // Use shared memory for better performance
    __shared__ float sharedA[1024]; // Assuming max size 1024, adjust as needed

    float indexValue = a[base + index];
    sharedA[threadIdx.x] = a[base + threadIdx.x];

    __syncthreads();

    // Use loop unrolling for optimization
    for (int j = index + 1; j < size; j += 4) {
        a[base + j] -= indexValue * sharedA[j];
        if (j + 1 < size) a[base + j + 1] -= indexValue * sharedA[j + 1];
        if (j + 2 < size) a[base + j + 2] -= indexValue * sharedA[j + 2];
        if (j + 3 < size) a[base + j + 3] -= indexValue * sharedA[j + 3];
    }
}