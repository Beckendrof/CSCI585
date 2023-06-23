**Q1**  
The linear regression equation is as follows:

```
class = -0.1084 * CRIM + 0.0458 * ZN +
    2.7187 * CHAS=1 - 17.376  * NOX +
    3.8016 * RM - 1.4927 * DIS +
    0.2996 * RAD - 0.0118 * TAX - 
    0.9465 * PTRATIO + 0.0093 * B - 
    0.5226 * LSTAT + 36.3411
```

The equation for the model comprises 12 terms, with the initial 11 being the product of weights and features, and the final term standing as the intercept.

In this context, three particular features `INDUS`, `AGE`, and `CHAS=0` are not included in the model. This is a consequence of the M5 attribute selection method employed.
This technique commences by incorporating all descriptors, subsequently shedding those with the least significant standardized regression coefficients in a stepwise fashion. 
This process continues until there's no observable enhancement in the average prediction error estimation, as quantified by the Akaike Information Criterion.

In the case at hand, eliminating these three features `INDUS`, `AGE`, and `CHAS=0` had no measurable impact on the value of the error. As a result, they were excluded from 
the model to maintain simplicity and accuracy.

**Q2


