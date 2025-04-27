#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void device_add(int *a, int *b, int *c) {
    // Pre-calculate and cache frequently accessed memory positions
    int index = blockDim.x * blockIdx.x + threadIdx.x;
    // Utilize registers for temporary storage to reduce memory latency
    int valueA = a[index];
    int valueB = b[index];
    c[index] = valueA + valueB;
}