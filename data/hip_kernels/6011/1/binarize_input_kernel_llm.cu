#include "hip/hip_runtime.h"
#include "includes.h"

#ifdef CUDNN
#pragma comment(lib, "cudnn.lib")
#endif

extern "C" {
}

extern "C" {
double get_time_point();
void start_timer();
void stop_timer();
double get_time();
void stop_timer_and_show();
void stop_timer_and_show_name(char *name);
void show_total_time();
}

__global__ void binarize_input_kernel(float *input, int n, int size, float *binary)
{
    int s = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (s >= size) return;
    
    // Utilize shared memory for intermediate values
    extern __shared__ float shared_mem[];
    float *shared_mean = shared_mem;
    
    float mean = 0.0f;

    // Calculate sum of absolute inputs for this block
    for (int i = 0; i < n; ++i) {
        mean += fabs(input[i * size + s]);
    }

    // Calculate mean over 'n' and store in shared memory
    shared_mean[threadIdx.x] = mean / n;
    __syncthreads();

    // Assign mean value to binary output, with positive/negative check
    float binarized_value = (input[threadIdx.x * size + s] > 0) ? shared_mean[threadIdx.x] : -shared_mean[threadIdx.x];
    for (int i = 0; i < n; ++i) {
        binary[i * size + s] = binarized_value;
    }
}