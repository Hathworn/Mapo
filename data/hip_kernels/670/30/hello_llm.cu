#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello() {
    // Use register caching to optimize thread ID retrieval
    int tid = threadIdx.x;
    printf("Hello world! I'm thread %d\n", tid);
}