#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void softmax_device(int n, float *input, float temp, float *output) {
    extern __shared__ float shared_mem[]; // Use shared memory to optimize
    float *e_vals = shared_mem;
    int i = threadIdx.x;
    if (i < n) {
        float sum = 0;
        float largest = -INFINITY;

        // Find the largest value
        for (int j = i; j < n; j += blockDim.x) {
            float val = input[j];
            largest = (val > largest) ? val : largest;
        }
        largest = __shfl_sync(0xFFFFFFFF, largest, 0);

        // Calculate exp values, store temporarily in shared memory and calculate sum
        for (int j = i; j < n; j += blockDim.x) {
            float e = expf(input[j] / temp - largest / temp);
            e_vals[j] = e;
            sum += e;
        }
        sum = __shfl_sync(0xFFFFFFFF, sum, 0);

        // Normalize the output values
        if (i < n) {
            for (int j = i; j < n; j += blockDim.x) {
                output[j] = e_vals[j] / sum;
            }
        }
    }
}

__global__ void softmax_kernel(int n, int offset, int batch, float *input, float temp, float *output) {
    int b = blockIdx.x * blockDim.x + threadIdx.x;
    if (b >= batch) return;
    softmax_device(n, input + b * offset, temp, output + b * offset);
}
```
