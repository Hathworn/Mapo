#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void testPrint() {
    printf("DEVICE PRINT \n");
}

__global__ void launchDecode() {
    // Use shared memory for potential performance improvement
    __shared__ int placeholder; // Placeholder for future shared memory use

    // Use thread index to conditionally print, reduce redundant calls
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        printf("RUNNING\n");
        testPrint();
    }
}