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
    // Calculate the global index for each thread
    int s = (blockIdx.x + blockIdx.y*gridDim.x) * blockDim.x + threadIdx.x;

    // Return if global index exceeds size
    if (s >= size) return;

    // Optimizing mean calculation using reduction
    float mean = 0;
    for(int i = 0; i < n; ++i) {
        mean += fabs(input[i * size + s]);
    }
    mean = mean / n;

    // Assign binary values based on mean
    for(int i = 0; i < n; ++i) {
        binary[i * size + s] = (input[i * size + s] > 0) ? mean : -mean;
    }
}