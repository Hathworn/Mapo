#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void momentum_update_1D_1D(float* x, float* d, float* m, float learning_rate, float momentum, float gradClip, bool nesterov, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Unroll the loop for better performance
    for (int index = tid; index < size; index += stride) {
        float temp = d[index];
        
        // Use fminf and fmaxf for fast gradient clipping
        temp = fminf(fmaxf(temp, -gradClip), gradClip);
        
        m[index] = m[index] * momentum + temp;
        
        if (nesterov) {
            temp += momentum * m[index]; 
        } else {
            temp = m[index];
        }

        x[index] -= learning_rate * temp;
        
        d[index] = 0.0f; // Use 0.0f for consistent float assignment
    }
}