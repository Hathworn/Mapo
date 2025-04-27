#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {
}

#define TB 256
#define EPS 1e-4

__global__ void reconstruction_best_kernel(float *input, float *filtered_affine_model, float *filtered_best_output, int h, int w)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    int size = h * w;

    if (id < size) {
        // Load frequently used data once
        float input_id = input[id];
        float input_id_size = input[id + size];
        float input_id_2size = input[id + 2 * size];
        float *affine_model_id = &filtered_affine_model[id * 12];

        // Compute outputs using shared affine model data
        double out1 = input_id_2size * affine_model_id[0] +
                      input_id_size * affine_model_id[1] +
                      input_id * affine_model_id[2] +
                      affine_model_id[3];
        double out2 = input_id_2size * affine_model_id[4] +
                      input_id_size * affine_model_id[5] +
                      input_id * affine_model_id[6] +
                      affine_model_id[7];
        double out3 = input_id_2size * affine_model_id[8] +
                      input_id_size * affine_model_id[9] +
                      input_id * affine_model_id[10] +
                      affine_model_id[11];

        // Store output results
        filtered_best_output[id] = out1;
        filtered_best_output[id + size] = out2;
        filtered_best_output[id + 2 * size] = out3;
    }
    return;
}