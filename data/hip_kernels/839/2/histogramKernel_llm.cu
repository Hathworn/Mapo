#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void histogramKernel(unsigned char* image, long img_size, unsigned int* histogram, int hist_size) {
    // Define shared memory for local histogram
    extern __shared__ unsigned int local_hist[];

    // Initialize shared memory to zero
    int tid = threadIdx.x;
    int global_index = blockIdx.x * blockDim.x + tid;
    if (tid < hist_size) {
        local_hist[tid] = 0;
    }
    __syncthreads();

    // Aggregate data into local histogram using a stride loop
    for (long i = global_index; i < img_size; i += blockDim.x * gridDim.x) {
        atomicAdd(&local_hist[image[i]], 1);
    }
    __syncthreads();

    // Combine local histograms into global histogram using atomic operations
    if (tid < hist_size) {
        atomicAdd(&histogram[tid], local_hist[tid]);
    }
}