#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel(void) {
printf("GPU bockIdx %i threadIdx %i: Hello World!\n", blockIdx.x, threadIdx.x);
}