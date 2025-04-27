#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void rotate_180( float* data,int nx, int nxy, int offset, unsigned int size) {

    const uint x = threadIdx.x;
    const uint y = blockIdx.x;

    // Use dynamic shared memory to avoid excess usage
    extern __shared__ float shared_data[];

    float* shared_lower_data = shared_data;
    float* shared_upper_data = shared_data + blockDim.x;

    // Load data into shared memory with coalesced access
    shared_lower_data[x] = data[x + y * MAX_THREADS + offset];
    shared_upper_data[x] = data[nxy + x + (-y - 1) * MAX_THREADS - offset];
    __syncthreads();

    // Swap using shared memory
    if (x < size) {
        float tmp = shared_lower_data[x];
        shared_lower_data[x] = shared_upper_data[MAX_THREADS - x - 1];
        shared_upper_data[MAX_THREADS - x - 1] = tmp;
    }
    __syncthreads();

    // Write back to global memory with coalesced access
    if (x < size) {
        data[nxy - x - 1 + (-y) * MAX_THREADS - offset] = shared_upper_data[MAX_THREADS - x - 1];
        data[x + y * MAX_THREADS + offset] = shared_lower_data[x];
    }
}