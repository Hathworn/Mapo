#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void column_sum(const float* data, float* sum, int nx, int ny, int num_threads, int offset) {

    float s = 0.0f;
    // Utilize grid-stride loop for better occupancy and coalescing
    for (uint idx = threadIdx.x + blockIdx.x * num_threads + offset; idx < nx; idx += gridDim.x * num_threads) {
        for (int i = 0; i < ny; i++) {
            s += data[idx + i * nx];
        }
        sum[idx] = s;
    }
}