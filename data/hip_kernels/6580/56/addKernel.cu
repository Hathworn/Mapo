#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void addKernel(float* A, int size){
int id = blockIdx.x * blockDim.x + threadIdx.x;

if(id < size){
A[id] = 1 + A[id];
}
}