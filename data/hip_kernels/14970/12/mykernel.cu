#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mykernel(){
printf("Hello world from device!\n");
} /* end kernel */