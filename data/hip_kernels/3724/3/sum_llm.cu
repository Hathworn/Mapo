#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sum(long int* device_num, long int* device_den, long int* device_vet, int size, int x)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x + x;
    int j;

    // Use shared memory for device_num and device_den to reduce global memory access
    extern __shared__ long int shared_mem[];
    long int* shared_num = shared_mem;
    long int* shared_den = shared_mem + size;

    if (i < size) {
        shared_num[i] = device_num[i];
        shared_den[i] = device_den[i];
    }
    __syncthreads();

    if (i < size) {
        for (j = i + 1; j < size; j++) {
            if ((shared_num[i] == shared_num[j]) && (shared_den[i] == shared_den[j]))
                atomicAdd(&device_vet[i], 1); // Use atomic operation to avoid race conditions
        }
    }
}