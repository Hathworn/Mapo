#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void calcDenseBackwardGPU( float *dz_in, float *dz, float *in, float *weights, float *biases, float *gradients, float *dW, float *dB, int batch_size, int in_size_x, int in_size_y, int in_size_z, int out_size_x, int out_size_y, int out_size_z, float momentum, float decay )
{
    // Calculate global thread ID
    int id = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    int id_out = id;
    if( id_out < batch_size * in_size_x * in_size_y * in_size_z * out_size_x ) {
        
        // Calculate input and output indices
        int id_in  = id / out_size_x;
        int n = id % out_size_x;
        id /= out_size_x;
        int i = id % in_size_x;
        id /= in_size_x;
        int j = id % in_size_y;
        id /= in_size_y;
        int z = id % in_size_z;
        int b = id / in_size_z;

        int w_size_x = in_size_x * in_size_y * in_size_z;
        int m = z * (in_size_x * in_size_y) + j * (in_size_x) + i;

        // Load and calculate without a loop for n
        float dzin = dz_in[b * (out_size_x * out_size_y * out_size_z) + n];
        int w_index = n * w_size_x + m;
        float w = weights[w_index];

        gradients[(n * batch_size + b) * 2] = dzin;
        atomicAdd(&dz[id_in], dzin * w);  // Use atomicAdd to prevent race conditions
        atomicAdd(&dW[w_index], in[id_in] * (gradients[(n * batch_size + b) * 2] + gradients[(n * batch_size + b) * 2 + 1] * momentum) + (decay * w));
    }
}