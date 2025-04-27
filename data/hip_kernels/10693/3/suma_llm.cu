#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void suma(int a, int b, int *c) {
    // Use shared memory for faster access
    __shared__ int temp;
    temp = a + b;

    // Use atomic operation to safely write the result from multiple threads
    if (threadIdx.x == 0) {
        atomicAdd(c, temp);
    }
}