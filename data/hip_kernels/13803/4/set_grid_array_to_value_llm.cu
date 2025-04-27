#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_grid_array_to_value(float *arr, float value, int N_grid) {
    // Calculate 1D index considering 3D grid and block dimensions
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int idy = blockIdx.y * blockDim.y + threadIdx.y;
    int idz = blockIdx.z * blockDim.z + threadIdx.z;

    // Linearized index calculation
    int index = idz * N_grid * N_grid + idy * N_grid + idx;

    // Boundary check and setting value
    if (idx < N_grid && idy < N_grid && idz < N_grid) {
        arr[index] = value;
    }
}