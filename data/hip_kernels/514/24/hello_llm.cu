#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void hello()
{
    // Use a single printf statement outside the loop
    if (threadIdx.x == 0) {
        for (int i = 0; i < blockDim.x; ++i) {
            printf("Hello world! I'm thread %d\n", i);
        }
    }
}