#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void helloFromGPU(void) {
    // Use threadIdx and blockIdx to create more unique outputs for each thread
    // Reduce contention on printf usage for higher occupancy
    int idx = blockIdx.x * blockDim.x + threadIdx.x; 
    printf("Hello World from GPU! Thread: %d\n", idx);
}