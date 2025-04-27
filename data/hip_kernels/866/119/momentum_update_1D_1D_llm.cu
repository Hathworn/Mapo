#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void momentum_update_1D_1D(float* x, float* d, float* m, float learning_rate, float momentum, float gradClip, bool nesterov, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    
    // Use __restrict__ to indicate no aliasing
    float* __restrict__ d_restrict = d;
    float* __restrict__ m_restrict = m;
    
    for (; tid < size; tid += stride) {
        // Efficient memory access
        float temp = __ldg(&d_restrict[tid]);
        
        // Apply gradient clipping
        if (temp > gradClip) temp = gradClip;
        if (temp < -gradClip) temp = -gradClip;
        
        // Update momentum
        float* m_ptr = &m_restrict[tid];
        *m_ptr = *m_ptr * momentum + temp;
        
        // Apply Nesterov acceleration if enabled
        temp = nesterov ? (temp + momentum * *m_ptr) : *m_ptr;
        
        // Update position vector
        x[tid] -= learning_rate * temp;
        
        // Reset gradient
        d_restrict[tid] = 0.0f;
    }
}