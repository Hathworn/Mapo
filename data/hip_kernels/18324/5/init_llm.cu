#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init(uint32_t *v, uint32_t val, uint32_t n) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n) {
        v[i] = val; // Assign value if within bounds
    }
    if (i == 0 && blockIdx.x == 0) {
        printf("init\n"); // Ensure printf is executed once
    }
}