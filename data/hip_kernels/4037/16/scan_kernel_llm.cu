#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scan_kernel(unsigned int* d_bins, int size) {
    int mid = threadIdx.x + blockDim.x * blockIdx.x;
    if (mid >= size) return;

    for (int s = 1; s <= size; s *= 2) {
        int spot = mid - s;
        
        // Use shared memory to reduce global memory access latency
        __shared__ unsigned int shared_bins[1024]; // Adjust size as needed based on block size
        shared_bins[threadIdx.x] = d_bins[mid];
        __syncthreads(); // Ensure all threads have written to shared memory
        
        unsigned int val = 0;
        if (spot >= 0) val = shared_bins[threadIdx.x - s];
        __syncthreads(); // Sync before writing back to global memory
        
        if (spot >= 0) d_bins[mid] += val;
        __syncthreads();
    }
}