#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void suma(int a, int b, int *c){
    // Use a single thread for the operation to reduce unnecessary warp execution
    if (threadIdx.x == 0) {
        *c = a + b;
    }
}