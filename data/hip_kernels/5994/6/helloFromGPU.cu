#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void helloFromGPU(void){
printf("Hello World from GPU!\n");
}