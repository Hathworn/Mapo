#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void hello()
{
    // Use threadIdx.x only to reduce redundant computations
    int tid = threadIdx.x;
    int bid = blockIdx.x;

    // Load hello string once and reuse
    const char* helloString = "Hello from Thread";

    printf("%s %d in block %d\n", helloString, tid, bid); 
}