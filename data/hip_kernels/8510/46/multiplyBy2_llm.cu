#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void multiplyBy2(int size, long *in, long *out) {
    // Calculate the global index
    const int ix = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory for better access efficiency
    __shared__ long sharedMem[1024]; // Assuming blockDim.x <= 1024

    if (ix < size) {
        // Load data from global to shared memory
        sharedMem[threadIdx.x] = in[ix];

        // Ensure all threads have loaded their data
        __syncthreads();

        // Perform operation using shared memory
        sharedMem[threadIdx.x] *= 2;

        // Ensure all operations are complete
        __syncthreads();

        // Write back to global memory
        out[ix] = sharedMem[threadIdx.x];
    }
}