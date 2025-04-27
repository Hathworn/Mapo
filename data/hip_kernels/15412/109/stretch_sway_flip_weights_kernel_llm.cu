```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void stretch_sway_flip_weights_kernel(const float *src_weight_gpu, float *weight_deform_gpu, int nweights, int n, int kernel_size, float angle, int reverse)
{
    const int index = blockIdx.x*blockDim.x + threadIdx.x;
    const int kernel_area = kernel_size * kernel_size;
    const int i = index * kernel_area;

    const int stage_step = (nweights / kernel_area) / 8;  // 8 stages
    const int stage_id = index / stage_step;

    if (i < nweights)
    {
        if (stage_id == 0) {
            // Unroll loop to improve memory access pattern
            for (int y = 0; y < kernel_size; y += 2) {
                for (int x = 0; x < kernel_size; ++x) {
                    weight_deform_gpu[x + y*kernel_size + i] = src_weight_gpu[x + y*kernel_size + i];
                    if (y + 1 < kernel_size) {
                        weight_deform_gpu[x + (y+1)*kernel_size + i] = src_weight_gpu[x + (y+1)*kernel_size + i];
                    }
                }
            }
        }
        else if (stage_id == 1 || stage_id == 2 || stage_id == 3 || stage_id == 4)
        {
            float scale = 0.5;
            if (stage_id == 1) scale = 0.65;
            else if (stage_id == 2) scale = 0.8;
            else if (stage_id == 3) scale = 1.2;
            else if (stage_id == 4) scale = 1.4;

            if (reverse) scale = 1 / scale;

            const int x_c = kernel_size / 2;
            const int y_c = kernel_size / 2;

            float dropout_sum = 0;

            for (int y = 0; y < kernel_size; ++y) {
                for (int x = 0; x < kernel_size; ++x) {
                    float x_s = x_c + (x - x_c) / scale;
                    float y_s = y_c + (y - y_c) / scale;

                    int x_0 = floor(x_s);
                    int x_1 = ceil(x_s);
                    if (x_0 == x_1) x_1 = x_0 + 1;
                    int y_0 = floor(y_s);
                    int y_1 = ceil(y_s);
                    if (y_0 == y_1) y_1 = y_0 + 1;

                    float c_x_0 = x_1 - x_s;
                    float c_x_1 = x_s - x_0;
                    float c_y_0 = y_1 - y_s;
                    float c_y_1 = y_s - y_0;

                    float val = 0;
                    // Use a shared helper function to simplify repetitive code
                    auto add_value = [&](int x, int y, float cx, float cy) {
                        if (x >= 0 && x < kernel_size && y >= 0 && y < kernel_size)
                            val += src_weight_gpu[x + y*kernel_size + i] * cx * cy;
                        else
                            dropout_sum += cx * cy;
                    };

                    add_value(x_0, y_0, c_x_0, c_y_0);
                    add_value(x_1, y_0, c_x_1, c_y_0);
                    add_value(x_0, y_1, c_x_0, c_y_1);
                    add_value(x_1, y_1, c_x_1, c_y_1);

                    weight_deform_gpu[x + y*kernel_size + i] = val;
                }
            }

            // Remove the nested loop for applying compensation
            if (scale > 1) {
                float inverse_scale = 1 / scale;
                for (int y = 0; y < kernel_size; ++y) {
                    for (int x = 0; x < kernel_size; ++x) {
                        weight_deform_gpu[x + y*kernel_size + i] *= inverse_scale;
                    }
                }
            }
        }
        else if (stage_id == 5 || stage_id == 6)
        {
            // Precompute angle coefficients
            if (stage_id == 6) angle = -angle;
            if (reverse) angle = -angle;

            const float cos_a = cosf(angle * 3.14159265 / 180);
            const float sin_a = sinf(angle * 3.14159265 / 180);
            const int x_c = kernel_size / 2;
            const int y_c = kernel_size / 2;

            float dropout_sum = 0;

            for (int y = 0; y < kernel_size; ++y) {
                for (int x = 0; x < kernel_size; ++x) {
                    float x_s = x_c + (x - x_c)*cos_a + (y - y_c)*sin_a;
                    float y_s = y_c - (x - x_c)*sin_a + (y - y_c)*cos_a;

                    int x_0 = floor(x_s);
                    int x_1 = ceil(x_s);
                    if (x_0 == x_1) x_1 = x_0 + 1;
                    int y_0 = floor(y_s);
                    int y_1 = ceil(y_s);
                    if (y_0 == y_1) y_1 = y_0 + 1;

                    float c_x_0 = x_1 - x_s;
                    float c_x_1 = x_s - x_0;
                    float c_y_0 = y_1 - y_s;
                    float c_y_1 = y_s - y_0;

                    float val = 0;

                    auto add_value = [&](int x, int y, float cx, float cy) {
                        if (x >= 0 && x < kernel_size && y >= 0 && y < kernel_size)
                            val += src_weight_gpu[x + y*kernel_size + i] * cx * cy;
                        else
                            dropout_sum += cx * cy;
                    };

                    add_value(x_0, y_0, c_x_0, c_y_0);
                    add_value(x_1, y_0, c_x_1, c_y_0);
                    add_value(x_0, y_1, c_x_0, c_y_1);
                    add_value(x_1, y_1, c_x_1, c_y_1);

                    weight_deform_gpu[x + y*kernel_size + i] = val;
                }
            }

            const float coef = (kernel_size*kernel_size) / (kernel_size*kernel_size - dropout_sum);
            for (int y = 0; y < kernel_size; ++y) {
                for (int x = 0; x < kernel_size; ++x) {
                    weight_deform_gpu[x + y*kernel_size + i] *= coef;
                }
            }
        }
        else if (stage_id == 7)
        {
            // Flip using reverse indexing
            for (int y = 0; y < kernel_size; ++y) {
                for (int x = 0; x < kernel_size; ++x) {
                    weight_deform_gpu[(kernel_size - x - 1) + y*kernel_size + i] = src_weight_gpu[x + y*kernel_size + i];
                }
            }
        }
    }
}