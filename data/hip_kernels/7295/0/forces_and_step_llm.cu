#include "hip/hip_runtime.h"
#include "includes.h"

#define G_CONSTANT 6.67430e-11  // Define gravitational constant

__global__ void forces_and_step(double *bodies_input, double *bodies_output, unsigned int count, double dt, uint16_t bods_per_thread)
{
    unsigned int index = ((blockIdx.x * blockDim.x) + threadIdx.x) * 5 * bods_per_thread;

    for (int b = 0; b < bods_per_thread; b++)
    {
        // If there are more threads than data discard the extra computations to stay in defined memory
        if (index < count * 5)
        {
            // Calculate force for this particle
            double fx = 0.0;
            double fy = 0.0;
            double m1 = bodies_input[index + 4];  // Mass of current body

            for (uint32_t i = 0; i < count * 5; i += 5)
            {
                double dir_x = bodies_input[i] - bodies_input[index];
                double dir_y = bodies_input[i + 1] - bodies_input[index + 1];
                double m2 = bodies_input[i + 4];  // Mass of other body

                // Make sure there is no division by zero
                double distance_squared = dir_x * dir_x + dir_y * dir_y;
                if (distance_squared > 0.0)
                {
                    double distance = sqrt(distance_squared);
                    double force_magnitude = G_CONSTANT * m1 * m2 / (distance_squared * distance);
                    fx += dir_x * force_magnitude;
                    fy += dir_y * force_magnitude;
                }
            }

            // Integration
            bodies_output[index + 2] = bodies_input[index + 2] + (fx / m1) * dt;
            bodies_output[index + 3] = bodies_input[index + 3] + (fy / m1) * dt;
            bodies_output[index] = bodies_input[index] + bodies_output[index + 2] * dt;
            bodies_output[index + 1] = bodies_input[index + 1] + bodies_output[index + 3] * dt;
            bodies_output[index + 4] = m1;  // Preserve the mass
        }
        index += 5;
    }
}