#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binZeros(int *d_bin_count, int bin_size) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Use loop unrolling for better performance if the bin_size is a known multiple
    if (i < bin_size) {
        d_bin_count[i] = 0;
        if (i + blockDim.x < bin_size) d_bin_count[i + blockDim.x] = 0;
        if (i + 2 * blockDim.x < bin_size) d_bin_count[i + 2 * blockDim.x] = 0;
        if (i + 3 * blockDim.x < bin_size) d_bin_count[i + 3 * blockDim.x] = 0;
    }
}