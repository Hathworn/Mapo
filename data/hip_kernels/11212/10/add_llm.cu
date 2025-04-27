#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int a, int b, int *c) {
    // Use shared memory for better performance on write
    __shared__ int temp;
    if (threadIdx.x == 0) {
        temp = a + b;
        *c = temp;
    }
}