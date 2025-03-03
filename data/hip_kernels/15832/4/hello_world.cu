#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void hello_world() {

printf("Hello CUDA world \n");

}