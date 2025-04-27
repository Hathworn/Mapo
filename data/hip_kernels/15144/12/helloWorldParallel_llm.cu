#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void helloWorldParallel(void) {
    int i = threadIdx.x; 
    int j = blockIdx.x; 

    // Optimize printf usage by combining values into a single string for efficiency.
    printf("Hello world from GPU %d/%d\n", j, i);
}