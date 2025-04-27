#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void computeMinEnergyMatrix(float *energy, float *min_energy, int height, int width) {
    const int bid = blockIdx.x;
    const int tid = threadIdx.x;
    const int pos = bid * blockDim.x + tid;

    extern __shared__ float shared_row_energy[];

    // Load initial row into shared memory
    if(pos < width) {
        shared_row_energy[tid] = energy[tid];
        min_energy[tid] = energy[tid];
    } else {
        return;
    }
    __syncthreads();
    
    for(int i = 1; i < height; i++) {
        float l, m, r;
        float current = energy[i * width + tid];

        // Check bounds for left, middle, right
        l = (tid > 0) ? shared_row_energy[tid - 1] : 999999999;
        m = shared_row_energy[tid];
        r = (tid < width - 1) ? shared_row_energy[tid + 1] : 999999999;

        // Calculate minimum energy
        float minimum = current + min(l, min(m, r));

        // Update shared memory and output
        shared_row_energy[tid] = minimum;
        min_energy[i * width + tid] = minimum;

        __syncthreads();
    }
}