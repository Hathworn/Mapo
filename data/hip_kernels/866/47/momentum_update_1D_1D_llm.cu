#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void momentum_update_1D_1D(float* x, float* d, float* m, float learning_rate, float momentum, float gradClip, bool nesterov, int size) {
    // Efficient tid calculation to minimize warp divergence
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Using shared memory to reduce global memory access; not applicable directly here, maintain simple optimization
    for (; tid < size; tid += stride) {
        float temp = d[tid];

        // Use ternary operator for compact and potentially faster comparison and assignment
        temp = temp > gradClip ? gradClip : (temp < -gradClip ? -gradClip : temp);

        // Minimize operations by reducing multiple accesses
        float m_tid = m[tid] * momentum + temp;
        m[tid] = m_tid;

        // Conditional logic optimized to minimize branch divergence
        temp = nesterov ? temp + momentum * m_tid : m_tid;

        // Update x array with efficient access
        x[tid] -= learning_rate * temp;

        // Reset d array to zero; maintain efficient writing
        d[tid] = 0;
    }
}