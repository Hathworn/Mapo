#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cuda_olamundo(){
printf("Ola Mundo direto da GPU!\n");
}