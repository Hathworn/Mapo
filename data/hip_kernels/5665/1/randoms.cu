#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void randoms(hiprandState_t* states, float* numbers, float lower, float higher) {
int index = blockDim.x * blockIdx.x + threadIdx.x;
numbers[index] = lower + (higher - lower) * hiprand_uniform(&states[index]);
}