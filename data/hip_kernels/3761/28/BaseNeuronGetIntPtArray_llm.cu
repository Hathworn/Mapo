#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void BaseNeuronGetIntPtArray(int *arr1, int *arr2, int *pos, int n_elem, int step1, int step2)
{
    // Use shared memory for faster access
    __shared__ int shared_pos[256]; 
    int array_idx = threadIdx.x + blockIdx.x * blockDim.x;
    if (threadIdx.x < n_elem) {
        shared_pos[threadIdx.x] = pos[threadIdx.x];
    }
    __syncthreads(); // Ensure all threads have completed shared memory initialization

    if (array_idx < n_elem) {
        // Use shared memory to access 'pos' values
        arr2[array_idx * step2] = arr1[shared_pos[threadIdx.x] * step1];
    }
}