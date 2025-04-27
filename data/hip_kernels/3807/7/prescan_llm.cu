#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function to perform prescan
__global__ void prescan(float* d_in, int nGlobe, int step, int upSweep) {
    int tid = blockDim.x * blockIdx.x + threadIdx.x;
    int offset = 2 * tid * (step + 1); // Calculate shared offset

    // Calculate indices for from and to
    int from = offset + step;
    int to = offset + 2 * step + 1;

    if (upSweep) {
        d_in[to] += d_in[from]; // Up-sweep: combine results
    } else {
        int temp = d_in[from]; // Use a temporary variable to swap
        d_in[from] = d_in[to];
        d_in[to] += temp; // Down-sweep: add and update result
    }
}