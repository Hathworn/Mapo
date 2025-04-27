#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(float *array, int size) {
    // Using a single thread to print the array size
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        printf("### Array size: %d\n", size);
    }

    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Process only valid threads
    if (index < size) {
        array[index] += 1.f;
    }
}