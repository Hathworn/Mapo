#include "hip/hip_runtime.h"
#include "includes.h"

// Use __restrict__ to tell the compiler that pointers don't alias
__global__ void add(const int* __restrict__ a, const int* __restrict__ b, int* __restrict__ c) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    // Utilize shared memory for coalesced memory access (assumes blockDim.x <= 1024)
    __shared__ int shared_a[1024];
    __shared__ int shared_b[1024];

    // Load elements into shared memory
    shared_a[threadIdx.x] = a[id];
    shared_b[threadIdx.x] = b[id];
    __syncthreads();

    // Perform addition using shared memory
    c[id] = shared_a[threadIdx.x] + shared_b[threadIdx.x];
}