#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int test() {
    return 10;
}

__global__ void testDrive() {
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Avoids unnecessary call for every thread
    if (index < blockDim.x) {
        printf("%d\n", index);
        int num = test();
        printf("num = %d\n", num);
    }
}