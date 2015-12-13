#include <stdio.h>
#include <time.h>
#include <stdlib.h>

#define NUM 100000

void prefix_sum_chal(int *__restrict__ v, int *__restrict__ w, int N) {
// void prefix_sum_chal(int* v, int* w, int N) {
  int i, j;
  for (i = 0; i < N; ++i) {
    v[i] = 0;
    for (j = 0; j < N; ++j) {
      v[i] += w[j];
    }
  }
}

int n[NUM];
int v[NUM];

int main() {
	srand(time(NULL));
	int i  = 0;
	for(; i < NUM; i += 1) {
		n[i] = rand();
		v[i] = rand();
	}
	prefix_sum_chal(n, v, NUM);

	return 0;
}