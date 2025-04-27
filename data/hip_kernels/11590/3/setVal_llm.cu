#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void setVal(int* testfuck, int size) {
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    if (id < size) { // Ensure thread does not exceed the array bounds
        testfuck[id] = size - id;
    }
}