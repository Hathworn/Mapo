#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Vector_Addition(const int *dev_a, const int *dev_b, int *dev_c) {
    // Calculate global thread ID uniquely
    unsigned int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Utilize the stride pattern to allow coalesced memory accesses
    int stride = blockDim.x * gridDim.x;
    
    // Optimize loop with stride and ensure it only processes available work
    for (int i = tid; i < N; i += stride) {
        dev_c[i] = dev_a[i] + dev_b[i];
    }
}