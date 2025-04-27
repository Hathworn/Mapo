#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sortMatrix ( const int nd, const float *a, float *sm ) {
    // Compute row and column indices
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;

    // Compute linear index in the array
    int ij = i + j * nd;

    // Check bounds and perform operation
    if (i < nd && j < nd) {
        sm[ij] = (a[i] > a[j]);
    }
}