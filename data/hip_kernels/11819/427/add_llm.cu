#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void add(int *a, int *b, int *c)
{
    extern __shared__ int shared_mem[];
    int * shmem = shared_mem;
    
    int tid = threadIdx.x;  // Use a temporary variable for thread index

    shmem[tid] = tid;  // Simplified to reuse the computed value
    int value = shmem[tid];  // Store shared memory value in a local variable

    a[tid] = value;  // Use local variable instead of multiple shared memory accesses
    b[tid] = value;  // Use local variable instead of multiple shared memory accesses
    c[tid] = a[tid] + b[tid];  // Sum values in registers
}