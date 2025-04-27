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
    // Calculate unique global thread index
    int f = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread index does not exceed number of weight sets
    if (f < n) {
        float mean = 0.0f;

        // Use a single loop to calculate mean directly
        for (int i = 0; i < size; ++i) {
            float w = weights[f * size + i];
            mean += fabsf(w);
            binary[f * size + i] = (w > 0) ? 1.0f : -1.0f;
        }
        mean /= size;

        // Multiply binary results with mean in a single pass
        for (int i = 0; i < size; ++i) {
            binary[f * size + i] *= mean;
        }
    }
}