#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fourier_transform(float *in, float *out, int height, int width, int blockConfig) {
    // Use shared memory to reduce global memory accesses
    extern __shared__ float shared_in[];

    int my_x = blockIdx.x * blockDim.x + threadIdx.x;
    int threadIndex = threadIdx.x;
    float realSum = 0.0;

    // Load elements into shared memory
    for (int t = threadIndex; t < width * height; t += blockDim.x) {
        shared_in[t] = in[t];
    }
    __syncthreads();

    // Calculate Fourier transform using shared memory
    if (my_x < height * width) {
        for (int k = 0; k < height; k++) {
            realSum = 0.0;
            for (int t = 0; t < width; t++) {
                float angle = 2 * M_PI * (my_x * height + t) * (my_x * width + k) / height;
                realSum += shared_in[my_x * height + t] * cos(angle);
            }
            out[my_x * height + k] = realSum;
        }
    }
}