#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AplusB(int *ret, int a, int b) {
    // Optimize by computing sum once and reusing the result
    int result = a + b;
    ret[threadIdx.x] = result + threadIdx.x;
}