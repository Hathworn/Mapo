#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Fprop2(const float* layer1, const float* syn2, float* out)
{
    int i = blockDim.y * blockIdx.y + threadIdx.y;  // Compute output neuron index
    int j = blockIdx.x;  // Data sample index

    float x = 0.0f;
    // Use shared memory for syn2 to improve access speed
    __shared__ float shared_syn2[256][10];

    int idx = threadIdx.x * 10 + i;  // Linear thread index for syn2
    if (i < 10) {
        // Load syn2 into shared memory
        for (int k = threadIdx.x; k < 256; k += blockDim.x) {
            shared_syn2[k][i] = syn2[k * 10 + i];
        }
    }
    __syncthreads();  // Ensure all syn2 data is loaded

    // Compute dot product using shared_syn2
    for (int k = 0; k < 256; ++k) {
        x += layer1[j * 256 + k] * shared_syn2[k][i];
    }

    out[j * 10 + i] = x;  // Write result to output
}