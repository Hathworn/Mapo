#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void printHello() {
printf("The Device says \"Hello World\"\n");
}