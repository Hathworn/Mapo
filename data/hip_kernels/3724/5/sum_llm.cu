#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sum(long int* device_num, long int* device_den, long int* device_vet, int size, int x)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x + x;
    int j;

    // Check bounds to avoid unnecessary computations.
    if (i < size) {
        // Use shared memory for repeated accesses within the same block.
        __shared__ long int shared_num[1024];
        __shared__ long int shared_den[1024];

        // Load data into shared memory.
        shared_num[threadIdx.x] = device_num[i];
        shared_den[threadIdx.x] = device_den[i];
        __syncthreads();

        for (j = i + 1; j < size; j++) {
            // Minimize global memory accesses by using shared memory.
            if ((shared_num[threadIdx.x] == device_num[j]) && (shared_den[threadIdx.x] == device_den[j])) {
                atomicAdd(&device_vet[i], 1); // Use atomic operation for thread safety.
            }
        }
    }
}