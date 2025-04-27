#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void isnan_check_device(double *array, int size, bool *check) {
    // Calculate the unique thread index 
    int idx = threadIdx.x + blockDim.x * blockIdx.x;

    // Use shared memory to improve performance by reducing global memory access
    __shared__ bool local_check;

    // Initialize shared memory for each block
    if (threadIdx.x == 0) local_check = false;
    __syncthreads();

    // Check for NaN only if within bounds
    if (idx < size && ::isnan(array[idx])) {
        atomicExch(&local_check, true); // Use atomic operation to prevent race conditions
    }

    // Sync to ensure all threads have updated local_check
    __syncthreads();

    // Update global 'check' from local_check
    if (threadIdx.x == 0 && local_check) {
        atomicExch(check, true); // Atomically update global check
    }
}