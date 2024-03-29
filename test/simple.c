#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define N 100000

int main(int argc, char *argv[]) {
  uint64_t j, i, nthreads, tid;
  float a[N], b[N], c[N], d[N];

  clock_t start_t = clock();

  /* Some initializations */
  for (i = 0; i < N; i++) {
    a[i] = i * 1.5;
    b[i] = i + 22.35;
    c[i] = d[i] = 1.0;
  }


  for (j = 0; j < N; j++) {
    for (i = 0; i < N; i++) {
      c[i] = a[i] + b[i] - d[i] / c[j];
      d[j] = c[i] * (a[i] - b[i]);
    }
  }

  // printf("Thread %d doing section 2\n",tid);
  for (i = 0; i < N; i++) {
    d[i] = a[i] * b[i] / d[i] + c[i];
    // printf("Thread %d: d[%d]= %f\n",tid,i,d[i]);
  }

  double total_t = (double)(clock() - start_t) / CLOCKS_PER_SEC;

  printf("output: %f, %f\n", c[0], d[1]);
  printf("time: %f\n", total_t);
}
