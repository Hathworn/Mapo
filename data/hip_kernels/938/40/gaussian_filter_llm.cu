#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gaussian_filter(unsigned *in, unsigned *out, int width, int height) {
    __shared__ unsigned int shared_data[4]; // Use shared memory to store inputs being processed

    int x = blockIdx.x * 2 + threadIdx.x;
    int y = blockIdx.y * 2 + threadIdx.y;

    if (x < width && y < height) {
        shared_data[threadIdx.y * 2 + threadIdx.x] = in[y * width + x]; // Load inputs into shared memory
    } else {
        shared_data[threadIdx.y * 2 + threadIdx.x] = 0; // Handle boundary conditions
    }

    __syncthreads();

    if (threadIdx.x == 0 && threadIdx.y == 0) {
        unsigned int cikti = shared_data[0] + shared_data[1] + shared_data[2] + shared_data[3];

        out[blockIdx.y * width / 2 + blockIdx.x] = cikti; // Write result to output
    }
}