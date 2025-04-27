#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void clear_best_distances(int *best_distances, int rays_number) {
    // Use a grid-stride loop to ensure all threads do useful work
    for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < rays_number; i += blockDim.x * gridDim.x) {
        best_distances[i] = INT32_MAX;
    }
}