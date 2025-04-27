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


__global__ void binarize_weights_kernel(float *weights, int n, int size, float *binary)
{
    int f = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation
    if (f >= n) return;

    float sum = 0;
    float* weight_ptr = weights + f * size; // Pointer to the start of the current weight set
    float* binary_ptr = binary + f * size;  // Pointer to the start of the current binary set

    // Calculate mean of absolute weights
    for(int i = 0; i < size; ++i){
        sum += fabs(weight_ptr[i]);
    }
    float mean = sum / size;

    // Binarize weights based on mean
    for(int i = 0; i < size; ++i){
        binary_ptr[i] = (weight_ptr[i] > 0) ? mean : -mean;
    }
}