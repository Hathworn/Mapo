#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void quickSum(double* energyTempor, int size) {
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    int step = gridDim.x * blockDim.x;  // Calculate the total number of threads

    for (long long offset = 1; offset < size * size; offset *= 2) {
        // Use the calculated step size for indexing
        for (int i = index; (i * 2 + 1) * offset < size * size; i += step) {
            energyTempor[i * 2 * offset] += energyTempor[(i * 2 + 1) * offset];
        }
        __syncthreads();
    }
}