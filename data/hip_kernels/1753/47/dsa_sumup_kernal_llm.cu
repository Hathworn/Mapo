#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void dsa_sumup_kernal(float* results, const int inx, const int iny)
{
    extern __shared__ float shared[]; // Use shared memory for partial sums
    int tidx = threadIdx.x;
    int bd = blockDim.x;
    int size = iny * (inx / 2 + 1);

    float dot = 0.0f;
    float vweight = 0.0f;
    float power = 0.0f;
    float power2 = 0.0f;

    for (int i = tidx; i < (inx / 2 + 1); i += bd) { // Loop unrolling by using thread-specific stride
        int idx = i;
        dot += results[idx];
        vweight += results[size + idx];
        power += results[2 * size + idx];
        power2 += results[3 * size + idx];
    }

    // Reduce partial sums within block
    shared[tidx] = dot;
    shared[bd + tidx] = vweight;
    shared[2 * bd + tidx] = power;
    shared[3 * bd + tidx] = power2;
    __syncthreads();

    // Sequential addressing reduction
    for (int offset = bd / 2; offset > 0; offset >>= 1) {
        if (tidx < offset) {
            shared[tidx] += shared[tidx + offset];
            shared[bd + tidx] += shared[bd + tidx + offset];
            shared[2 * bd + tidx] += shared[2 * bd + tidx + offset];
            shared[3 * bd + tidx] += shared[3 * bd + tidx + offset];
        }
        __syncthreads();
    }

    // Output the reduced result to global memory
    if (tidx == 0) {
        results[0] = shared[0];
        results[size] = shared[bd];
        results[2 * size] = shared[2 * bd];
        results[3 * size] = shared[3 * bd];
    }
}