#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void forward_softmax_layer_kernel( int n, int batch, float *input, float temp, float *output )
{
    int b = blockIdx.x * blockDim.x + threadIdx.x;
    if( b >= batch ) return;

    // Reduce memory access by using shared memory for input and output
    extern __shared__ float shared_mem[];
    float* shared_input = shared_mem;
    float* shared_output = shared_mem + n;

    // Load input to shared memory
    for (int i = threadIdx.x; i < n; i += blockDim.x) {
        shared_input[i] = input[i + b*n];
    }
    __syncthreads();

    float sum = 0;
    float largest = -INFINITY;

    // Find the largest element
    for( int i = 0; i < n; ++i ) {
        float val = shared_input[i];
        largest = fmaxf(val, largest);
    }

    // Compute sum and avoid recalculating exp(largest/temp)
    for( int i = 0; i < n; ++i ) {
        sum += expf(shared_input[i] / temp - largest / temp);
    }
    sum = (sum != 0) ? largest / temp + logf(sum) : largest - 100;

    // Calculate the softmax output
    for (int i = threadIdx.x; i < n; i += blockDim.x) {
        shared_output[i] = expf(shared_input[i] / temp - sum);
        output[i + b*n] = shared_output[i];
    }
}