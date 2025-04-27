#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {
}

__global__ void cross_entropy_forward(unsigned int batch_size, unsigned int nclasses, const float* x, const float* t, float* y) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    if (tid < batch_size) {
        // Load the starting address for the specific batch
        const float* x_batch = x + tid * nclasses;
        const float* t_batch = t + tid * nclasses;
        float* y_batch = y + tid * nclasses;

        // Compute max value of slice
        float m = x_batch[0];
        for(int i = 1; i < nclasses; ++i) {
            m = fmaxf(x_batch[i], m);
        }

        // Subtract max and accumulate softmax
        float s = 0.0f;
        for(int i = 0; i < nclasses; ++i) {
            y_batch[i] = x_batch[i] - m;
            s += expf(y_batch[i]);
        }

        // Compute ln(s)
        float ln_s = logf(s);

        // Update y with the final values
        for(int i = 0; i < nclasses; ++i) {
            y_batch[i] = (ln_s - y_batch[i]) * t_batch[i];
        }
    }
}