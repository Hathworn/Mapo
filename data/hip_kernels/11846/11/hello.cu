#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void hello(char *a, int *b) {
a[threadIdx.x] += b[threadIdx.x];
}