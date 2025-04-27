#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void activate_array_normalize_channels_kernel(float *x, int size, int batch, int channels, int wh_step, float *output_gpu)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    const float eps = 0.0001;
    if (i < size) {
        int wh_i = i % wh_step;  // Calculate wh_i outside of the loops
        int b = i / wh_step;     // Calculate b outside of the loops
        
        float sum = eps;
        
        // Use shared memory to reduce global memory accesses
        __shared__ float shared_x[wh_step * channels];
        
        int thread_id = threadIdx.x;
        
        for (int k = thread_id; k < channels; k += blockDim.x) {
            shared_x[wh_i + k * wh_step] = x[wh_i + k * wh_step + b*wh_step*channels];
        }
        
        __syncthreads(); // Synchronize threads to ensure shared memory is populated
        
        // Sum calculation using shared memory
        for (int k = 0; k < channels; ++k) {
            float val = shared_x[wh_i + k * wh_step];
            if (val > 0) sum += val;
        }

        // Normalization process using shared memory
        for (int k = 0; k < channels; ++k) {
            float val = shared_x[wh_i + k * wh_step];
            if (val > 0) val = val / sum;
            else val = 0;
            output_gpu[wh_i + k * wh_step + b*wh_step*channels] = val; // Write result to global memory
        }
    }
}