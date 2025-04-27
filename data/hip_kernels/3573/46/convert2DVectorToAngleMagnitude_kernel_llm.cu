#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel to convert 2D vector to angle and magnitude
__global__ void convert2DVectorToAngleMagnitude_kernel(uchar4 *d_angle_image, uchar4 *d_magnitude_image, float *d_vector_X, float *d_vector_Y, int width, int height, float lower_ang, float upper_ang, float lower_mag, float upper_mag) {
    const int x = blockIdx.x * blockDim.x + threadIdx.x; // Use standard index calculation
    const int y = blockIdx.y * blockDim.y + threadIdx.y;
    uchar4 temp_angle, temp_magnitude;

    if (x < width && y < height) {
        float vector_X = d_vector_X[y * width + x]; // Simplify array access
        float vector_Y = d_vector_Y[y * width + x];

        // Compute angle and magnitude
        float angle = atan2f(vector_Y, vector_X);
        float magnitude = hypotf(vector_X, vector_Y); // Use hypotf for magnitude

        // First draw unmatched pixels in white
        if (!isfinite(magnitude)) {
            temp_angle = make_uchar4(255, 255, 255, 255); // Use make_uchar4 for initialization
            temp_magnitude = make_uchar4(255, 255, 255, 255);
        } else {
            // Rescale angle and magnitude from [lower,upper] to [0,1] and convert to RGBA jet colorspace
            angle = (angle - lower_ang) / (upper_ang - lower_ang);

            float r = 1.0f, g = 1.0f, b = 1.0f;

            // Optimize color calculation using fewer branches
            if (angle < 0.25f) {
                r = 0;
                g = angle * 4.0f;
            } else if (angle < 0.5f) {
                r = 0;
                b = 1.0f + 4.0f * (0.25f - angle);
            } else if (angle < 0.75f) {
                r = 4.0f * (angle - 0.5f);
                b = 0;
            } else {
                g = 1.0f + 4.0f * (0.75f - angle);
                b = 0;
            }

            temp_angle = make_uchar4(static_cast<unsigned char>(255.0f * r), 
                                     static_cast<unsigned char>(255.0f * g), 
                                     static_cast<unsigned char>(255.0f * b), 
                                     255);

            magnitude = (magnitude - lower_mag) / (upper_mag - lower_mag);

            r = 1.0f, g = 1.0f, b = 1.0f;

            if (magnitude < 0.25f) {
                r = 0;
                g = magnitude * 4.0f;
            } else if (magnitude < 0.5f) {
                r = 0;
                b = 1.0f + 4.0f * (0.25f - magnitude);
            } else if (magnitude < 0.75f) {
                r = 4.0f * (magnitude - 0.5f);
                b = 0;
            } else {
                g = 1.0f + 4.0f * (0.75f - magnitude);
                b = 0;
            }

            temp_magnitude = make_uchar4(static_cast<unsigned char>(255.0f * r), 
                                      static_cast<unsigned char>(255.0f * g), 
                                      static_cast<unsigned char>(255.0f * b), 
                                      255);
        }

        d_angle_image[y * width + x] = temp_angle; // Simplified index calculations
        d_magnitude_image[y * width + x] = temp_magnitude;
    }
}