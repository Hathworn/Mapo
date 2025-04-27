#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void createMovieRatingsKernel(const float *weights, const float *initial_hidden_feature_probs, float* movie_rating_probs, int num_movies, int num_hidden_features) {

    unsigned int movie_rating_id = blockIdx.x * blockDim.x + threadIdx.x;

    // Loop over all movie_id/rating_id pairs handled by this thread
    while (movie_rating_id < num_movies * 5) {
        float dot_prod = 0.0f; // Initialize dot product

        // Unrolled loop for optimizing dot product calculation
        for (unsigned int hidden_id = 0; hidden_id < num_hidden_features; hidden_id += 4) {
            dot_prod += weights[movie_rating_id * num_hidden_features + hidden_id] * initial_hidden_feature_probs[hidden_id];
            if (hidden_id + 1 < num_hidden_features) {
                dot_prod += weights[movie_rating_id * num_hidden_features + hidden_id + 1] * initial_hidden_feature_probs[hidden_id + 1];
            }
            if (hidden_id + 2 < num_hidden_features) {
                dot_prod += weights[movie_rating_id * num_hidden_features + hidden_id + 2] * initial_hidden_feature_probs[hidden_id + 2];
            }
            if (hidden_id + 3 < num_hidden_features) {
                dot_prod += weights[movie_rating_id * num_hidden_features + hidden_id + 3] * initial_hidden_feature_probs[hidden_id + 3];
            }
        }

        // Store result
        movie_rating_probs[movie_rating_id] = dot_prod;

        // Move to the next point
        movie_rating_id += blockDim.x * gridDim.x;
    }
}