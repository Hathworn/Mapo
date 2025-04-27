#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subgradinputAtomic(float *gradInput, float *gradOutput, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
{
    // Calculate output size
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    // Compute offsets based on thread/block ID
    int o = blockIdx.x;
    int i = o;

    // Utilize shared memory to optimize memory access
    extern __shared__ float shared_gradOutput[];
    for (int idx = threadIdx.x; idx < output_w * output_h; idx += blockDim.x) {
        int yy = idx / output_w;
        int xx = idx % output_w;
        shared_gradOutput[idx] = gradOutput[o * output_w * output_h + yy * output_w + xx];
    }
    __syncthreads();

    // Compute gradInput in parallel
    for (int yy = blockIdx.y * blockDim.y + threadIdx.y; yy < output_h; yy += blockDim.y * gridDim.y) {
        for (int xx = threadIdx.x; xx < output_w; xx += blockDim.x) {
            float z = shared_gradOutput[yy * output_w + xx];
            float *ptr_gradInput = gradInput + i * input_w * input_h + yy * dH * input_w + xx * dW;
            for (int ky = 0; ky < kH; ky++) {
                for (int kx = 0; kx < kW; kx++) {
                    atomicAdd(&(ptr_gradInput[kx]), z / float(kW * kH));
                }
                ptr_gradInput += input_w;
            }
        }
    }
}