#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void floattoint(int *out, float *in) {
    // Use shared memory for potential performance improvement
    __shared__ int shared_out[1];
    __shared__ float shared_in[1];

    // Load data into shared memory
    shared_in[0] = in[0];
    __syncthreads();

    // Efficiently convert float to int
    shared_out[0] = *(int *)&shared_in[0];
    __syncthreads();

    // Store result from shared memory to global memory
    out[0] = shared_out[0];
}