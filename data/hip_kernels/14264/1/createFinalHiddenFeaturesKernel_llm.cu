#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void createFinalHiddenFeaturesKernel(const float *weights, const float *movie_rating_probs, float* final_hidden_feature_probs, int num_movies, int num_hidden_features) {

    // Calculate unique global thread index
    unsigned int hidden_id = blockIdx.x * blockDim.x + threadIdx.x;
    float dot_prod; // Temporary, local dot product variable

    // Ensure the thread works until all the hidden features are processed
    while (hidden_id < num_hidden_features) {
        dot_prod = 0.0f; // Reset the dot product to 0

        // Iterate over each movie
        for (int movie_id = 0; movie_id < num_movies; movie_id++) {
            // Vectorized dot product computation for movie ratings
            #pragma unroll
            for (int rating = 0; rating < 5; rating++) {
                dot_prod += weights[movie_id * 5 * num_hidden_features + rating * num_hidden_features + hidden_id]
                            * movie_rating_probs[movie_id * 5 + rating];
            }
        }

        // Store the dot_product result
        final_hidden_feature_probs[hidden_id] = dot_prod;

        // Move to the next element of the hidden features for the current thread
        hidden_id += blockDim.x * gridDim.x;
    }
}