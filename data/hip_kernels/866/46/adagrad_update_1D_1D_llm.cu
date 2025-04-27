#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void adagrad_update_1D_1D(float* x, float* d, float* m, float clip, float lr, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Using loop unrolling for performance improvement
    for (; tid < size; tid += stride * 4) {
        int index = tid;
        if (index < size) {
            float grad = d[index];
            grad = fminf(fmaxf(grad, -clip), clip); // Combine clipping in one line
            m[index] += grad * grad;
            x[index] -= lr * grad / sqrtf(m[index] + 1e-8f);
            d[index] = 0;
        }
        
        if (index + stride < size) {
            float grad = d[index + stride];
            grad = fminf(fmaxf(grad, -clip), clip);
            m[index + stride] += grad * grad;
            x[index + stride] -= lr * grad / sqrtf(m[index + stride] + 1e-8f);
            d[index + stride] = 0;
        }
        
        if (index + 2 * stride < size) {
            float grad = d[index + 2 * stride];
            grad = fminf(fmaxf(grad, -clip), clip);
            m[index + 2 * stride] += grad * grad;
            x[index + 2 * stride] -= lr * grad / sqrtf(m[index + 2 * stride] + 1e-8f);
            d[index + 2 * stride] = 0;
        }
        
        if (index + 3 * stride < size) {
            float grad = d[index + 3 * stride];
            grad = fminf(fmaxf(grad, -clip), clip);
            m[index + 3 * stride] += grad * grad;
            x[index + 3 * stride] -= lr * grad / sqrtf(m[index + 3 * stride] + 1e-8f);
            d[index + 3 * stride] = 0;
        }
    }
}