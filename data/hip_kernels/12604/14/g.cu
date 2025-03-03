#include "hip/hip_runtime.h"
#include "includes.h"
__device__ int d(void) { return 8; }
__global__ void g(void) {}