#include "hip/hip_runtime.h"
#include "includes.h"

/*
152096 - William Matheus
Friendly Numbers
Programacao Paralela e Distribuida
CUDA - 2019/2 - UPF
Programa 2 - Kernel
*/

__global__ void sum(long int* device_num, long int* device_den, long int* device_vet, int size, int x)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x + x;
    
    // Use shared memory for reductions
    extern __shared__ long int shared_mem[];
    long int *shared_num = shared_mem;
    long int *shared_den = shared_mem + blockDim.x;

    if (i < size) {
        shared_num[threadIdx.x] = device_num[i];
        shared_den[threadIdx.x] = device_den[i];

        __syncthreads();

        // Local computations within the block
        for (int j = threadIdx.x + 1; j < blockDim.x; j++) {
            int idx = blockIdx.x * blockDim.x + j + x;
            if (idx < size) {
                if ((shared_num[threadIdx.x] == device_num[idx]) && (shared_den[threadIdx.x] == device_den[idx])) {
                    atomicAdd(&device_vet[i], 1);
                }
            }
        }
    }
}