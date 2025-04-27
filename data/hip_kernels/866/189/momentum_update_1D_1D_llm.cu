#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void momentum_update_1D_1D(float* x, float* d, float* m, float learning_rate, float momentum, float gradClip, bool nesterov, int size) {
    // Cache stride calculation
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Loop unrolling for better performance
    for (int i = tid; i < size; i += stride) {
        // Efficient clamping using min/max functions
        float temp = fmaxf(fminf(d[i], gradClip), -gradClip);

        // Momentum calculation
        float m_update = momentum * m[i] + temp;
        if (nesterov) {
            temp += momentum * m_update;
        } else {
            temp = m_update;
        }

        // Efficiently update values
        m[i] = m_update;
        x[i] -= learning_rate * temp;
        d[i] = 0; // Reset gradient
    }
}