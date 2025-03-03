#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void helloFromGPU() {
printf("Hello from GPU!\n");
}