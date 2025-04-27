#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_distance(int* data, float* distance, int* point, int n, int dim) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure index is within bounds
    if (i < n) {
        float d = 0.0f;

        // Optimize by unrolling loops when possible
        for (int j = 0; j < dim; ++j) {
            d += fabsf(static_cast<float>(data[i * dim + j] - point[j])); // Use fabsf for float
        }

        distance[i] = d;
    }
}