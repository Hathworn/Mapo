#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void convert2DVectorToAngleMagnitude_kernel(uchar4 *d_angle_image, uchar4 *d_magnitude_image, float *d_vector_X, float *d_vector_Y, int width, int height, float lower_ang, float upper_ang, float lower_mag, float upper_mag) {
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;
    if (x < width && y < height) {
        int idx = y * width + x;
        float vector_X = d_vector_X[idx];
        float vector_Y = d_vector_Y[idx];

        // compute angle and magnitude
        float angle = atan2f(vector_Y, vector_X);
        float magnitude = hypotf(vector_X, vector_Y);

        // prepare output colors
        uchar4 temp_angle;
        uchar4 temp_magnitude;

        if (!isfinite(magnitude)) {
            // Unmatched pixels in white
            temp_angle = make_uchar4(255, 255, 255, 255);
            temp_magnitude = make_uchar4(255, 255, 255, 255);
        } else {
            // rescale angle and magnitude
            angle = (angle - lower_ang) / (upper_ang - lower_ang);
            magnitude = (magnitude - lower_mag) / (upper_mag - lower_mag);

            auto calculate_color = [](float value) -> uchar4 {
                float r = 1.0f, g = 1.0f, b = 1.0f;
                if (value < 0.25f) {
                    r = 0; g = 4.0f * value;
                } else if (value < 0.5f) {
                    r = 0; b = 1.0f + 4.0f * (0.25f - value);
                } else if (value < 0.75f) {
                    r = 4.0f * (value - 0.5f); b = 0;
                } else {
                    g = 1.0f + 4.0f * (0.75f - value); b = 0;
                }
                return make_uchar4(255.0f * r, 255.0f * g, 255.0f * b, 255);
            };

            temp_angle = calculate_color(angle);
            temp_magnitude = calculate_color(magnitude);
        }

        // store the results
        d_angle_image[idx] = temp_angle;
        d_magnitude_image[idx] = temp_magnitude;
    }
}