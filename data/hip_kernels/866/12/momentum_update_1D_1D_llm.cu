#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;
#ifndef MAP_FILE
#define MAP_FILE MAP_SHARED
#endif

__global__ void momentum_update_1D_1D(float* x, float* d, float* m, float learning_rate, float momentum, float gradClip, bool nesterov, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    while (tid < size) {
        float temp = d[tid]; // Access global memory once
        if (temp > gradClip) temp = gradClip; // Gradient clipping
        if (temp < -gradClip) temp = -gradClip;
        float mt = m[tid] * momentum + temp; // Update momentum
        if (nesterov) {
            temp += momentum * mt; // Nesterov update calculation
        } else {
            temp = mt;
        }
        x[tid] -= learning_rate * temp; // Update parameter
        m[tid] = mt; // Store updated momentum
        d[tid] = 0; // Reset gradient
        tid += stride;
    }
}