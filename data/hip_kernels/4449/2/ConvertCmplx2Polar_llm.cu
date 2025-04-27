#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize memory access by using shared memory
__global__ void ConvertCmplx2Polar(float* inRe, float* inIm, float* mag, float* phase, int size) {
    __shared__ float sharedRe[BLOCK_SIZE];
    __shared__ float sharedIm[BLOCK_SIZE];
    
    const int threadID = blockIdx.x * blockDim.x + threadIdx.x;
  
    for (int i = threadID; i < size; i += blockDim.x * gridDim.x) {
        // Load data into shared memory
        sharedRe[threadIdx.x] = inRe[i];
        sharedIm[threadIdx.x] = inIm[i];
        
        __syncthreads();
        
        // Calculate polar coordinates
        phase[i] = atan2f(sharedIm[threadIdx.x], sharedRe[threadIdx.x]);
        mag[i] = cmagf(sharedIm[threadIdx.x], sharedRe[threadIdx.x]);
        
        __syncthreads();
    }
}

__device__ static __inline__ float cmagf(float x, float y) {
    float a, b, v, w, t;
    a = fabsf(x);
    b = fabsf(y);
    if (a > b) {
        v = a;
        w = b;
    } else {
        v = b;
        w = a;
    }
    t = w / v;
    t = 1.0f + t * t;
    t = v * sqrtf(t);
    if ((v == 0.0f) || (v > 3.402823466e38f) || (w > 3.402823466e38f)) {
        t = v + w;
    }
    return t;
}