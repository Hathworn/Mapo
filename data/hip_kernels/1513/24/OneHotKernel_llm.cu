#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void OneHotKernel(const float* params, int64_t num_features, int embed_size, int batch_size, const int64_t* indices, float* ret) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x; // Calculate global thread index

    if (tid < batch_size * embed_size) { // Check boundary condition
        int batch_id = tid / embed_size; // Determine batch index
        int feature_id = tid % embed_size; // Determine feature index
        ret[tid] = params[(int64_t)indices[batch_id] * embed_size + feature_id]; // Fetch the appropriate value
    }
}