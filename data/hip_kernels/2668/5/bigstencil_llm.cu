#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bigstencil(int* in, int* out) {
    // Utilize the shared memory for faster access
    extern __shared__ int shared_in[];
    
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    shared_in[threadIdx.x] = in[i]; // Load input into shared memory
    __syncthreads(); // Ensure all threads have loaded data into shared memory

    // Perform computation using shared memory
    out[i] = shared_in[threadIdx.x] + 2;
}