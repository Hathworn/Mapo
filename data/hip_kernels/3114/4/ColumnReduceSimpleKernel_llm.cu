#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ColumnReduceSimpleKernel(const float* __restrict__ in, float* __restrict__ out, int num_planes, int num_rows, int num_cols) {
    // Use shared memory for reduced memory access latency
    extern __shared__ float shared_mem[];

    const int gid = threadIdx.x + blockIdx.x * blockDim.x;
    const int elems_per_plane = num_rows * num_cols;

    const int plane = gid / num_cols;
    const int col = gid % num_cols;

    if (plane >= num_planes)
        return;

    // Initialize sum in shared memory
    float* sum = shared_mem + threadIdx.x;
    *sum = 0.0f;

    // Unroll the loop for the first two rows
    *sum += in[plane * elems_per_plane + col] + in[plane * elems_per_plane + num_cols + col];

    // Perform reduction using shared memory
    for (int row = 2; row < num_rows; ++row) {
        *sum += in[plane * elems_per_plane + row * num_cols + col];
    }

    // Write the result to global memory
    out[plane * num_cols + col] = *sum;
}