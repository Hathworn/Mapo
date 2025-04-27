#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function using shared memory
__global__ void my_memsetIdx(int* dg_array, int size, int scale) {
    extern __shared__ int shared_data[];

    const int gtid = blockIdx.x * blockDim.x + threadIdx.x;
    const int tid = threadIdx.x;

    if (gtid < size) {
        shared_data[tid] = gtid * scale;  // Write to shared memory
        __syncthreads();  // Ensure all threads update shared memory
        dg_array[gtid] = shared_data[tid];  // Write from shared memory to global memory
    }
}