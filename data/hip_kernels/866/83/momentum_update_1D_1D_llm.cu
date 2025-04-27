#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void momentum_update_1D_1D(float* x, float* d, float* m, float learning_rate, float momentum, float gradClip, bool nesterov, int size) {
    // Optimize kernel with loop unrolling for better performance
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    #pragma unroll 4
    for (; tid < size; tid += stride) {
        float temp = d[tid];
        
        // Apply gradient clipping
        temp = fminf(fmaxf(temp, -gradClip), gradClip);
        
        // Update momentum
        m[tid] = momentum * m[tid] + temp;
        
        // Apply Nesterov momentum if needed
        if (nesterov) { 
            temp += momentum * m[tid]; 
        } else { 
            temp = m[tid]; 
        }
        
        // Update parameters
        x[tid] -= learning_rate * temp;
        d[tid] = 0;
    }
}