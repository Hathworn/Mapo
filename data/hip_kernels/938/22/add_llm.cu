#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *result, int *num1, int *num2) {
    // Use block and thread index; assume single block and single thread for simplicity
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx == 0) {
        *result = *num1 + *num2;  // Iterate over arrays may be required if arrays were intended
    }
}